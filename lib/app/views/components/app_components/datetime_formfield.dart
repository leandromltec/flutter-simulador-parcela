import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';

Widget dateTimeForm({required String labelText}) {
  return DateTimeFormField(
    dateFormat: DateFormat("dd/MM/yyyy"),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(10),
      hintStyle: TextStyle(color: Colors.black45),
      errorStyle: TextStyle(color: Colors.redAccent),
      border: OutlineInputBorder(),
      suffixIcon: Icon(Icons.event_note, color: Color(0xFF1565C0)),
      labelText: labelText,
    ),
    mode: DateTimeFieldPickerMode.date,
    autovalidateMode: AutovalidateMode.always,
    validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
    onDateSelected: (DateTime value) {
      print(value);
    },
  );
}

Widget hourMinuteForm({required String labelText}) {
  return DateTimeFormField(
    dateFormat: DateFormat("HH:mm"),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(10),
      hintStyle: TextStyle(color: Colors.black45), 
      errorStyle: TextStyle(color: Colors.redAccent),
      border: OutlineInputBorder(),
      suffixIcon: Icon(Icons.timer, color: Color(0xFF1565C0)),
      labelText: labelText,
    ),
    mode: DateTimeFieldPickerMode.time,
    autovalidateMode: AutovalidateMode.always,
    validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
    onDateSelected: (DateTime value) {
      print(value);
    },
  );
}
