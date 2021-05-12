import 'package:flutter/material.dart';

class EquipmentTile extends StatelessWidget {
  bool? isChecked = false;
  String equipmentTitle;
  void Function(bool?) checkboxCallback;

  EquipmentTile(
      {this.isChecked,
      required this.equipmentTitle,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          equipmentTitle,
          style: TextStyle(
              decoration: isChecked! ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkboxCallback,
        ));
  }
}
