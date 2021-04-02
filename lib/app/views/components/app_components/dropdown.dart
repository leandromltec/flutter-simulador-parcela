import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

class DropDownItems extends StatefulWidget {
  ItemDropdDown itemSelected;
  List<ItemDropdDown> listItemsDropDown;

  DropDownItems({required this.itemSelected, required this.listItemsDropDown});

  @override
  _DropDownItemsState createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.0,
                  style: BorderStyle.solid,
                  color: borderColorDropDown),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: widget.listItemsDropDown.map((ItemDropdDown e) {
            return DropdownMenuItem<ItemDropdDown>(
              child: Text(e.title),
              value: e,
            );
          }).toList(),
          isExpanded: true,
          hint: Text("Selecione"),
          onChanged: (value) {
            setState(() {
              //widget.itemSelected = value;
            });
          },
          value: widget.itemSelected,
        ),
      ),
    );
  }
}
