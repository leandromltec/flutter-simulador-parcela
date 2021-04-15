import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';

class PVITimeCourseScreen extends StatefulWidget {
  @override
  _PVITimeCourseScreenState createState() => _PVITimeCourseScreenState();
}

class _PVITimeCourseScreenState extends State<PVITimeCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return templatePage(
        columnSliverContentPage: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titlePage("Resultado filtros PVI"),
        dividerSession(),
        Container(width: double.infinity, child: Text("Módulo")),
        Container(
            width: double.infinity,
            child: Text("MD - Referente a gerência 1 (MDG1)")),
        SizedBox(height: 20),
        Container(width: double.infinity, child: Text("Empresa 1")),
        Container(width: double.infinity, child: Text("EMP - 1 (MD/G1)")),
        SizedBox(height: 20),
        Container(width: double.infinity, child: Text("Empresa 2")),
        Container(
            width: double.infinity,
            child: Text("EMP - Empresa de representação gerência 2 (MD/G1)")),
        SizedBox(height: 20),
        Container(width: double.infinity, child: Text("ONN")),
        Container(width: double.infinity, child: Text("MD - EMP1 (G1)")),
        SizedBox(height: 20),
        Container(width: double.infinity, child: Text("Valor")),
        Container(width: double.infinity, child: Text("R\$ 2565688")),
      ],
    ));
  }
}
