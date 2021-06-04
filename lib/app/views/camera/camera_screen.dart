import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/views/camera/camera.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/app_dropdown/dropdown.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
//import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:open_file/open_file.dart';

//https://pub.dev/packages/gallery_saver

//https://pub.dev/packages/image_gallery_saver

class CameraScreen extends StatefulWidget {
  final String? imagePath;
  final String? menuId;

  CameraScreen({this.imagePath, this.menuId});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final textFieldFocusNode = FocusNode();

  bool approvedPhoto = false;

  List<ItemDropdDown> lista = [
    ItemDropdDown(id: '0', title: 'EQ MODELO 1'),
    ItemDropdDown(id: '1', title: 'EQ MODELO 2'),
    ItemDropdDown(id: '2', title: 'EQ MODELO 3')
  ];

  Future<void> initializeCamera() async {
    final listCameras = await availableCameras();
    final camera = listCameras.first;

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraComponent(camera: camera)));
  }

  void _saveImageGallery() async {
    File? _storedImage = File(widget.imagePath!);

    final imageDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(_storedImage.path);

    await _storedImage.copy('${imageDir.path}/$fileName');

    //String testeUlr = '${imageDir.path}/$fileName'.split('.')[0];

    ///Uint8List bytes = base64.decode('${imageDir.path}/$fileName');

    /*File file = File(widget.imagePath!);
    await file.writeAsBytes(bytes);*/

    //await ImageGallerySaver.saveImage(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return templatePage(
        selectedItemMenuId: widget.menuId,
        widgetMaster: SingleChildScrollView(
          //reverse: true,
          child: Column(
            children: [
              titlePage("Fotografar Equipamento"),
              dividerSession(),
              if (widget.imagePath == null)
                GestureDetector(
                  onTap: () async {
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
              if (widget.imagePath != null && approvedPhoto == false)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            approvedPhoto = true;
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
              if (widget.imagePath != null && approvedPhoto == true)
                Column(
                  children: [
                    DropDownItems(
                      itemSelected: lista[0],
                      listItemsDropDown: lista,
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: Container(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            gerarPDF(context: context);
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

Future<void> gerarPDF({required BuildContext context}) async {
  //final dir = await syspaths.getExternalStorageDirectory();
  Directory dir = await syspaths.getApplicationDocumentsDirectory();
  final String path = "${dir.path}/example.pdf";
  File file = File(path);

  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Text("Fazendo teste");
      }));

  file.writeAsBytesSync(await pdf.save());

  await OpenFile.open(file.path);

  //await Printing.sharePdf(bytes: await pdf.save(), filename: 'my-document.pdf');
}
