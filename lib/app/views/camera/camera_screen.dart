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
        columnSliverContentPage: Column(
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
            /*Container(
                child: ElevatedButton(
              child: Text("Salvar"),
              onPressed: () {
                _saveImageGallery();
              },
            ))*/
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
                  )
                ],
              ),
            SizedBox(height: 20),
            DropDownItems(
              itemSelected: lista[0],
              listItemsDropDown: lista,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    labelText: "Descrição"),
                autofocus: true,
                textAlign: TextAlign.center,
                //controller: controller,
                onChanged: (value) {},
              ),
            ),
          ],
        ));
  }
}
