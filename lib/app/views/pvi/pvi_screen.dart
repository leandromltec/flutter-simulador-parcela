import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_simulador_parcela/app/controllers/pvi/pvi_controller.dart';
import 'package:flutter_simulador_parcela/app/models/app/item_dropdown.dart';
import 'package:flutter_simulador_parcela/app/shared/services/shared_local_service.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/app_dropdown/dropdown_required.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/app_dropdown/dropdown.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/message_fields.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/required_asterisk.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/title_dropdown.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

class PVIScreen extends StatefulWidget {
  @override
  _PVIScreenState createState() => _PVIScreenState();
}

class _PVIScreenState extends State<PVIScreen> {
  final controllerDropDown = Modular.get<ControllerPVI>();

  List<ItemDropdDown>? listManagement;

  var gerencia;

  var itemSelectedManagement;

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
      //ItemDropdDown(id: '0', title: 'Selecione'),
      ItemDropdDown(id: '0', title: 'Gerência 1'),
      ItemDropdDown(id: '1', title: 'Gerência 2')
    ];

    return templatePage(
        widgetMaster: Column(
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
        Observer(builder: (_) {
          if (controllerDropDown.listItemsDropdDown!.value == null)
            return CircularProgressIndicator();
          else
            return DropDownItems(
              dropdownButton: DropdownButton(
                hint: Text("Selecione"),
                items: (controllerDropDown.listItemsDropdDown!.value!
                    .map((ItemDropdDown e) {
                  return DropdownMenuItem<ItemDropdDown>(
                    child: Text(e.title!),
                    value: e,
                  );
                }).toList()),
                isExpanded: true,
                onChanged: (dynamic? value) {
                  setState(() {
                    itemSelectedManagement = value;
                    //widget.localStorage.put(widget.keyStorage, value.id);
                    /*String teste = jsonEncode(ItemDropdDown.fromJson(value));
              widget.localStorage.put(widget.keyStorage, teste);*/
                  });
                },
                value: itemSelectedManagement,
              ),
            );
        }),
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
          dropdownButton: DropdownButton(
            hint: Text("Selecione"),
            items: (lista.map((ItemDropdDown e) {
              return DropdownMenuItem<ItemDropdDown>(
                child: Text(e.title!),
                value: e,
              );
            }).toList()),
            isExpanded: true,
            onChanged: (dynamic? value) {
              setState(() {
                itemSelectedManagement = value;
                //widget.localStorage.put(widget.keyStorage, value.id);
                /*String teste = jsonEncode(ItemDropdDown.fromJson(value));
              widget.localStorage.put(widget.keyStorage, teste);*/
              });
            },
            value: itemSelectedManagement,
          ),
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
          dropdownButton: DropdownButton(
            hint: Text("Selecione"),
            items: (lista.map((ItemDropdDown e) {
              return DropdownMenuItem<ItemDropdDown>(
                child: Text(e.title!),
                value: e,
              );
            }).toList()),
            isExpanded: true,
            onChanged: (dynamic? value) {
              setState(() {
                itemSelectedManagement = value;
                //widget.localStorage.put(widget.keyStorage, value.id);
                /*String teste = jsonEncode(ItemDropdDown.fromJson(value));
              widget.localStorage.put(widget.keyStorage, teste);*/
              });
            },
            value: itemSelectedManagement,
          ),
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
              width: 200,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/pvi/resultado');
                },
                icon: Icon(Icons.search),
                label: Text(
                  'Filtrar',
                  style: TextStyle(fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: colorBackgroundElevatedButtonApp, elevation: 3),
              ),
            )),
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
