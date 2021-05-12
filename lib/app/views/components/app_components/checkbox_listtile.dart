import 'package:flutter/material.dart';

class CheckBoxListItemTile extends StatefulWidget {
  String titleCheckBox;

  CheckBoxListItemTile({required this.titleCheckBox});

  @override
  _CheckBoxListItemTileState createState() => _CheckBoxListItemTileState();
}

class _CheckBoxListItemTileState extends State<CheckBoxListItemTile> {
  bool valueChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.titleCheckBox,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.bold)),
      value: valueChecked,
      onChanged: (value) {
        setState(() {
          valueChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: const Color(0xFF1565C0),
    );
  }
}
