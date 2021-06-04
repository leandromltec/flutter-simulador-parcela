import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:package_info/package_info.dart';

//https://api.flutter.dev/flutter/dart-io/Platform-class.html
//https://pub.dev/packages/package_info

class AboutScreen extends StatefulWidget {
  final String? menuId;

  AboutScreen({this.menuId});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo? package;

  @override
  Widget build(BuildContext context) {
    return templatePage(
        selectedItemMenuId: widget.menuId,
        widgetMaster: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xFF0084c7),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                      child: Text(
                    "Simulador de Parcela Variável",
                    style: TextStyle(color: Colors.white),
                  ))),
              containerPage(
                  widgetContent: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "App disponível para Android e IOS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
              containerPage(
                  widgetContent: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Aplicativo desenvolvido com objetivo de prestação de contas com ANEEL," +
                    " caso haja atraso em serviços. Atende profissionais da empresa Eletrobrás, " +
                    "que estarão atuando nas estações com os respectivos serviços. \n" +
                    "Algumas funcionalidades como câmera, tarefas e estação  foram adicionadas a nível de comprovação de conhecimento."),
              )),
              containerPage(
                  widgetContent: Text("Tecnologia utilizada: Flutter")),
              containerPage(
                  widgetContent: Text("Plataforma atual: " +
                      Platform.operatingSystem.toString())),
              FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done)
                      return containerPage(
                          widgetContent: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text("Versão: ${snapshot.data!.version}"),
                      ));
                    else
                      return CircularProgressIndicator();
                  }),
              containerPage(
                  widgetContent: Text("Desenvolvido por:",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              containerPage(widgetContent: Text("Leandro Loureiro")),
              containerPage(
                  widgetContent: Text("Analista Desenvolvedor Web e Mobile")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.data_usage),
                      label: Text('Linkedin')),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.data_usage),
                      label: Text('Github'))
                ],
              )
            ],
          ),
        ));
  }

  Widget containerPage({required Widget widgetContent}) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
        alignment: Alignment.center,
        child: widgetContent);
  }
}
