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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              containerPage(textContent: "Simulador de Parcela Variável"),
              containerPage(textContent: "App disponível para Android e IOS"),
              containerPage(
                  textContent:
                      "Aplicativo desenvolvido com objetivo de prestação de contas com ANEEL, caso haja atraso em serviços."),
              containerPage(
                  textContent:
                      "Irá atender profissionais da empresa Eletrobrás, que estarão atuando nas estações com os respectivos serviços."),
              containerPage(textContent: "Tecnologia utilizada: Flutter"),
              containerPage(
                  textContent: "Plataforma atual: " +
                      Platform.operatingSystem.toString()),
              if (package != null)
                Container(
                  child: Text("Versão: " + package!.version),
                )
            ],
          ),
        ));
  }

  Widget containerPage({required String textContent}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      alignment: Alignment.center,
      child: Text(textContent),
    );
  }

  Future<void> _packageInfo() async {
    final PackageInfo infoPackage = await PackageInfo.fromPlatform();
    setState(() {
      package = infoPackage;
    });
  }
}
