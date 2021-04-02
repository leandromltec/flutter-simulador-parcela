import 'package:flutter/material.dart';

Widget titleDropDown({required String titleDropdown}) {
  return Container(
      margin: EdgeInsets.only(left: 25, bottom: 5, right: 8),
      //width: double.infinity,
      child: Text(
        titleDropdown,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ));
}
