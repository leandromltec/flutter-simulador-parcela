import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/services/shared_local_service.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/app_dropdown/dropdown_required.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/button_app.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/app_dropdown/dropdown.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/message_fields.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/required_asterisk.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/title_dropdown.dart';

class PVIScreen extends StatefulWidget {
  @override
  _PVIScreenState createState() => _PVIScreenState();
}

class _PVIScreenState extends State<PVIScreen> {
  var gerencia;

  bool requiredGerencia = false;
  bool requiredInstalacao = false;
  bool requiredNomeOperacional = false;

  SharedLocalStorage localStorage = new SharedLocalStorage();

  @override
  void initState() {
    _loadSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ItemDropdDown> lista = [
      ItemDropdDown(id: '0', title: 'Selecione'),
      ItemDropdDown(id: '1', title: 'Gerência 1'),
      ItemDropdDown(id: '2', title: 'Gerência 2')
    ];

    return templatePage(
        columnSliverContentPage: Column(
      children: [
        titlePage("Filtros PVI"),
        dividerSession(),
        messageField(
            icone: requiredAsterisk(),
            phraseInformationMessage: "Seleção obrigatória",
            colorPhraseInformationMessage: Colors.red),
        dividerSession(),
        SizedBox(height: 5),
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
          keyStorage: 'gerencia',
        ),
        if (requiredGerencia == true)
          RequiredInformationDropdown(
            iconeRequired: requiredAsterisk(),
            validatorRequired: "Selecione uma gerência",
            colorValidatorRequired: Colors.red,
          ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titleDropDown(titleDropdown: "Instalação"),
            requiredAsterisk()
          ],
        ),
        DropDownItems(
          itemSelected: lista[0],
          listItemsDropDown: lista,
        ),
        if (requiredInstalacao == true)
          RequiredInformationDropdown(
            iconeRequired: requiredAsterisk(),
            validatorRequired: "Selecione uma instalação",
            colorValidatorRequired: Colors.red,
          ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titleDropDown(titleDropdown: "Nome Operacional"),
            requiredAsterisk()
          ],
        ),
        DropDownItems(
          itemSelected: lista[0],
          listItemsDropDown: lista,
        ),
        SizedBox(height: 15),
        DropDownItems(
          itemSelected: lista[0],
          listItemsDropDown: lista,
        ),
        if (requiredNomeOperacional == true)
          RequiredInformationDropdown(
            iconeRequired: requiredAsterisk(),
            validatorRequired: "Selecione uma operação",
            colorValidatorRequired: Colors.red,
          ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            color: Colors.yellow,
            width: 200,
            height: 50,
            child: elevatedButton(
                titleButton: 'Filtrar',
                iconButton: Icons.search,
                onPressedFunction: () {
                  //if (requiredNomeOperacional == true)
                  Navigator.of(context).pushNamed('/pvi/filtros');
                }),
          ),
        ),
      ],
    ));
  }

  void _loadSelected() async {
    gerencia = await localStorage.getValor('gerencia');

    if (gerencia != null) {
      print("contem valor gerencia");
    }
  }
}
