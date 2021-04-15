import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';

Widget titleResultFilter({required String title}) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
    padding: EdgeInsets.all(4),
    //width: 100,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget resultTextFilter({required String resultText}) {
  return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      width: double.infinity,
      child: AutoSizeText(
        resultText,
        maxLines: 2,
        minFontSize: 12.0,
        maxFontSize: 14.0,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      ));
}

Widget selectedFiltersArea(
    {required String management,
    required String installation,
    required String operation,
    required String operationCode}) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
    padding: EdgeInsets.all(8),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            "Gerência",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(management),
        ),
        dividerSession(),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text("Instalação",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(installation),
        ),
        dividerSession(),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text("Operação",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(operation),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(operationCode),
        ),
      ],
    ),
  );
}
