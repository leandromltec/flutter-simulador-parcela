import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/dropdown.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/required_asterisk.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/title_dropdown.dart';

class PVIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ItemDropdDown> lista = [
      //ItemDropdDown(id: '0', title: 'Selecione'),
      ItemDropdDown(id: '1', title: 'Gerência 1'),
      ItemDropdDown(id: '2', title: 'Gerência 2')
    ];

    return templatePage(
        columnSliverContentPage: Column(
      children: [
        titlePage("Filtros PVI"),
        dividerSession(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titleDropDown(titleDropdown: "Gerência"),
            requiredAsterisk()
          ],
        ),
        DropDownItems(
          itemSelected: lista[0],
          listItemsDropDown: lista,
        )
      ],
    ));
  }
}
