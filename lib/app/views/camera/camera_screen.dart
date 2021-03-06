/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/shared/services/device_info_service.dart';
import 'package:flutter_simulador_parcela/app/views/camera/camera.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:intl/intl.dart';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

//https://pub.dev/packages/pdf

class CameraScreen extends StatefulWidget {
  final String? imagePath;
  final String? menuId;

  CameraScreen({this.imagePath, this.menuId});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final textFieldFocusNode = FocusNode();

  //Variável recebe valor de aprovação da foto (foto boa ou ruim)
  bool _approvedPhoto = false;

  TextEditingController _controllerDescription = new TextEditingController();

  //Função inícia o componente de câmera
  Future<void> initializeCamera() async {
    final listCameras = await availableCameras();
    final camera = listCameras.first;

    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraComponent(camera: camera)));
  }

  @override
  Widget build(BuildContext context) {
    return templatePage(
        selectedItemMenuId: widget.menuId,
        widgetMaster: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              titlePage("Fotografar Equipamento"),
              dividerSession(),
              if (widget.imagePath == null)
                GestureDetector(
                  onTap: () async {
                    //Chamada da função de câmera
                    initializeCamera();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 300,
                    height: 300,
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 50,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Toque para tirar uma foto",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )
              else
                Container(
                  width: 300,
                  height: 300,
                  child: Image.file(
                    File(widget.imagePath!),
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 10),
              if (widget.imagePath != null && _approvedPhoto == false)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _approvedPhoto = true;
                            textFieldFocusNode.unfocus();
                            textFieldFocusNode.canRequestFocus = false;
                          });
                        },
                        label: Text("Sim, ficou boa"),
                        icon: Icon(Icons.thumb_up),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          elevation: 3,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          initializeCamera();
                        },
                        label: Text("Não, nova foto"),
                        icon: Icon(Icons.thumb_down),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, elevation: 3),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20),
              if (widget.imagePath != null && _approvedPhoto == true)
                Column(
                  children: [
                    /*DropDownItems(
                      itemSelected: lista[0],
                      listItemsDropDown: lista,
                    ),*/
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TextFormField(
                          controller: _controllerDescription,
                          autocorrect: true,

                          focusNode: textFieldFocusNode,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              labelText: "Descrição"),
                          autofocus: true,
                          textAlign: TextAlign.left,
                          //controller: controller,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: Container(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            generatePDF(
                                context: context,
                                textDescription: _controllerDescription.text,
                                imagePath: widget.imagePath!);
                          },
                          label: Text("Gera relatório em PDF"),
                          icon: Icon(Icons.picture_as_pdf_rounded),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            elevation: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ));
  }
}

Future<void> generatePDF(
    {required BuildContext context,
    required String textDescription,
    required String imagePath}) async {
  //Diretório do dispositivo que armazena o caminho do arquivo pdf gerado
  Directory dir = await syspaths.getApplicationDocumentsDirectory();

  //Nome do arquivo em pdf que será composto da data atual
  DateTime dateCurrent = DateTime.now();
  final String pathName = "${dir.path}/equipamento-" +
      DateFormat("dd-MM-yyyy").format(dateCurrent) +
      ".pdf";

  //Gera o arquivo com o nome referenciado na variável pathName
  File file = File(pathName);

  //Defini um novo documento em pdf
  final pdf = pw.Document();

  //Variável recebe a imagem (através do seu caminho) lido em bytes
  final image = pw.MemoryImage(
    File(imagePath).readAsBytesSync(),
  );

  //Informações do dispostivo
  var deviceInfo = await getDeviceInfo();

  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
    build: (pw.Context context) {
      return pw.Column(children: [
        pw.Padding(
            padding: pw.EdgeInsets.only(bottom: 10),
            child: pw.Text(
                "Equipamento fotografado em " +
                    DateFormat("dd/MM/yyyy").format(dateCurrent),
                style: pw.TextStyle(fontSize: 16.0))),
        pw.Padding(
          padding: pw.EdgeInsets.only(bottom: 20),
          child: pw.Container(
              child: pw.Text("Fotografado pelo dispositivo - " +
                  deviceInfo['manufacturer'].toString().toUpperCase() +
                  " " +
                  deviceInfo['device'].toString().toUpperCase())),
        ),
        pw.Center(
            child: pw.Container(
          width: 250,
          height: 250,
          child: pw.Image(image, fit: pw.BoxFit.cover),
        )),
        pw.SizedBox(height: 20),
        containerTextPDF(
            childText: "Equipamento avalidado por : Leandro Loureiro"),
        containerTextPDF(childText: "Matrícula : TS3050"),
        pw.SizedBox(height: 20),
        containerTextPDF(childText: "Descrição", bold: true),
        pw.SizedBox(height: 10),
        containerTextPDF(childText: textDescription),
      ]);
    },
  ));

  //Salva o arquivo pdf no caminho do diretório
  file.writeAsBytesSync(await pdf.save());

  //Abre o arquivo em pdf gerado
  await OpenFile.open(file.path);
}

//Container criado para inclusão de textos abaixo da imagem, referente ao equipamento
pw.Container containerTextPDF({required String childText, bool? bold}) {
  return pw.Container(
    alignment: pw.Alignment.centerLeft,
    child: pw.Text(childText,
        style: pw.TextStyle(
            fontSize: 14.0,
            fontWeight:
                bold == true ? pw.FontWeight.bold : pw.FontWeight.normal)),
  );
}
