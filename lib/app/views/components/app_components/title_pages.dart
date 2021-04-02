import 'package:flutter/material.dart';

Widget titlePage(String titlePage) {
  return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Center(
          child: Text(
        titlePage,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      )));
}
