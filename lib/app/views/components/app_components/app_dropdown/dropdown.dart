
import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/shared/services/shared_local_service.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

class DropDownItems extends StatefulWidget {
  /*ItemDropdDown? itemSelected;
  List<ItemDropdDown> listItemsDropDown;
  dynamic? keyStorage;*/

  DropdownButton dropdownButton;

  SharedLocalStorage localStorage = new SharedLocalStorage();

  DropDownItems({required this.dropdownButton});

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
      height: 45,
      child: DropdownButtonHideUnderline(
        child: widget.dropdownButton,
        /*DropdownButton(
          items: widget.listItemsDropDown.map((ItemDropdDown e) {
            return DropdownMenuItem<ItemDropdDown>(
              child: Text(e.title!),
              value: e,
            );
          }).toList(),
          isExpanded: true,
          onChanged: (dynamic? value) {
            setState(() {
              widget.itemSelected = value;
              //widget.localStorage.put(widget.keyStorage, value.id);
              /*String teste = jsonEncode(ItemDropdDown.fromJson(value));
              widget.localStorage.put(widget.keyStorage, teste);*/
            });
          },
          value: widget.itemSelected,
        ),*/
      ),
    );
  }
}
