import 'package:flutter/material.dart';

class EquipmentTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Equipamento 1"),
      trailing: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}
