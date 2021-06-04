import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:package_info/package_info.dart';

//https://api.flutter.dev/flutter/dart-io/Platform-class.html

class AboutScreen extends StatefulWidget {
  final String? menuId;

  AboutScreen({this.menuId});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo? package;

  @override
  void initState() {
    _packageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return templatePage(
        selectedItemMenuId: widget.menuId,
        widgetMaster: Center(
          child: Column(
            children: [
              Container(
                child: Text("Simulador de Parcela Variável"),
              ),
              Container(
                child: Text("App disponível para Android e IOS"),
              ),
              Container(
                child: Text(
                    "Aplicativo desenvolvido com objetivo de prestação de contas com ANEEL, caso haja atraso em serviços."),
              ),
              Container(
                child: Text(
                    "Irá atender profissionais da empresa Eletrobrás, que estarão atuando nas estações com os respectivos serviços."),
              ),
              Container(
                child: Text("Tecnologia utilizada: Flutter"),
              ),
              Container(
                child: Text(
                    "Plataforma atual: " + Platform.operatingSystem.toString()),
              ),
              if (package != null)
                Container(
                  child: Text("Versão: " + package!.version),
                )
            ],
          ),
        ));
  }

  Future<void> _packageInfo() async {
    final PackageInfo infoPackage = await PackageInfo.fromPlatform();
    setState(() {
      package = infoPackage;
    });
  }
}
