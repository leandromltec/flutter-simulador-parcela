import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

Widget elevatedButton(
    {required String titleButton,
    required IconData iconButton,
    Function? onPressedFunction}) {
  return Container(
    width: 200,
    height: 40,
    child: ElevatedButton.icon(
      onPressed: () {
        onPressedFunction!;
      },
      icon: Icon(iconButton),
      label: Text(
        titleButton,
        style: TextStyle(fontSize: 16.0),
      ),
      style: ElevatedButton.styleFrom(
          primary: colorBackgroundElevatedButtonApp, elevation: 3),
    ),
  );
}
