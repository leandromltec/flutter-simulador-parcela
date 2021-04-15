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
      children: [
        titlePage("Resultado filtros PVI"),
        dividerSession(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Text("Programado")),
            Container(
              width: 30.0,
              child: Radio(
                value: 2,
                groupValue: 1,
                onChanged: (int? value) {
                  setState(() {});
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20), child: Text("Urgência")),
            Container(
              width: 30.0,
              child: Radio(
                value: 2,
                groupValue: 1,
                onChanged: (int? value) {
                  setState(() {});
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20), child: Text("Emergência")),
          ],
        )
      ],
    ));
  }
}
