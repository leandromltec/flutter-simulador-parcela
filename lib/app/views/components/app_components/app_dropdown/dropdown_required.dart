import 'package:flutter/material.dart';

class RequiredInformationDropdown extends StatefulWidget {
  Widget? iconeRequired;
  String validatorRequired;
  Color? colorValidatorRequired;

  RequiredInformationDropdown(
      {this.iconeRequired,
      required this.validatorRequired,
      this.colorValidatorRequired});

  @override
  _RequiredInformationDropdownState createState() =>
      _RequiredInformationDropdownState();
}

class _RequiredInformationDropdownState
    extends State<RequiredInformationDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.iconeRequired!,
            SizedBox(width: 5),
            Text(widget.validatorRequired,
                style: TextStyle(
                    fontSize: 12.0, color: widget.colorValidatorRequired)),
          ],
        ));
  }
}
