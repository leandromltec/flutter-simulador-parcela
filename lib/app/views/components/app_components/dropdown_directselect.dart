import 'package:flutter/material.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class DropDownDirectSelect extends StatefulWidget {
  final List<String> listItemDropDownDirectSelect;

  DropDownDirectSelect({required this.listItemDropDownDirectSelect});

  @override
  _DropDownDirectSelectState createState() => _DropDownDirectSelectState();
}

List<String> lista = <String>["Teste 1", "Teste 2"];

class _DropDownDirectSelectState extends State<DropDownDirectSelect> {
  String? itemSelecionado;

  @override
  Widget build(BuildContext context) {
    /*return Row(
      children: [
        Container(
          width: 150.0,
          child: ElevatedButton(
            child: Text("Scroll Picker"),
            onPressed: () => showMaterialScrollPicker(
              context: context,
              title: "Pick Your City",
              showDivider: false,
              items: lista,
              selectedItem: lista[0],
              onChanged: (value) => setState(() => itemSelecionado = 'teste'),
              onCancelled: () => print("Scroll Picker cancelled"),
              onConfirmed: () => print("Scroll Picker confirmed"),
            ),
          ),
        ),
      ],
    );*/

    return DirectSelectContainer(
      child: Card(
        child: Row(
          children: [
            Expanded(
              child: getDropDownList(widget.listItemDropDownDirectSelect),
            )
          ],
        ),
      ),
    );
  }
}

DirectSelectItem<String> _getDropDownMenuItem(String value) {
  return DirectSelectItem<String>(
      itemHeight: 56,
      value: value,
      itemBuilder: (context, value) {
        return Text(value);
      });
}

_getDslDecoration() {
  return BoxDecoration(
    border: BorderDirectional(
      bottom: BorderSide(width: 1, color: Colors.black12),
      top: BorderSide(width: 1, color: Colors.black12),
    ),
  );
}

DirectSelectList<String> getDropDownList(List<String> listItemsDropdDown) {
  return DirectSelectList<String>(
      values: listItemsDropdDown,
      defaultItemIndex: 3,
      itemBuilder: (String value) => _getDropDownMenuItem(value),
      focusedItemDecoration: _getDslDecoration(),
      onItemSelectedListener: (item, index, context) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(item)));
      });
}
