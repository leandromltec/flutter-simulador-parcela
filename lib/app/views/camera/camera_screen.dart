import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/camera/camera.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';

class CameraScreen extends StatefulWidget {
  final String? imagePath;

  CameraScreen({this.imagePath});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  Future<void> initializeCamera() async {
    final listCameras = await availableCameras();
    final camera = listCameras.first;

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraComponent(camera: camera)));
  }

  @override
  Widget build(BuildContext context) {
    return templatePage(
        columnSliverContentPage: Column(
      children: [
        titlePage("Fotografar Equipamento"),
        dividerSession(),
        if (widget.imagePath == null)
          GestureDetector(
            onTap: () async {
              initializeCamera();
              //Navigator.of(context).pushNamed('/camera/component');
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
            child: Image.file(File(widget.imagePath!)),
          )
      ],
    ));
  }
}
