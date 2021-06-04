import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import '';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return templatePage(widgetMaster: Column(children: [
      Container(child: 
        Text("Simulador de Parcela Variável")
      ,),
       Container(child: 
        Text("App disponível para Android e IOS")
      ,),
      Container(child: 
        Text("Aplicativo desenvolvido com objetivo de prestação de contas com ANEEL, caso haja atraso em serviços.")
      ,)
    ],));
  }
}
