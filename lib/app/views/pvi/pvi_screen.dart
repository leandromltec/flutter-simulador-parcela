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

  var listItemDropDown;

  var gerencia;

  List<ItemDropdDown> listInstallation = [];
  List<ItemDropdDown> listOperationalName = [];
  List<ItemDropdDown> listOperationalCode = [];

  ItemDropdDown? itemSelectedManagement;
  ItemDropdDown? itemSelectedInstallation;
  ItemDropdDown? itemSelectedOperationalName;
  ItemDropdDown? itemSelectedOperationalCode;

  String textHintInstallation = "Selecione uma gerênca para instalação";
  String textHintOperationalName = "Selecione uma instalação para operacional";
  String textHintOperationalCode = "Selecione uma operação para código";

  bool requiredGerencia = false;
  bool requiredInstalacao = false;
  bool requiredNomeOperacional = false;

  bool loadingInstallation = false;
  bool loadingOperationalName = false;
  bool loadingOperationalCode = false;

  SharedLocalStorage localStorage = new SharedLocalStorage();

  @override
  void initState() {
    //_loadSelected();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        //Início DropDown Gerência
        Observer(builder: (_) {
          if (controllerDropDown.listItemsDropdDown!.value == null)
            return CircularProgressIndicator();
          else {
            List<ItemDropdDown> listItemsManagement = controllerDropDown
                .listItemsDropdDown!.value!
              ..sort((a, b) =>
                  a.title!.toUpperCase().compareTo(b.title!.toUpperCase()));
            return DropDownItems(
              dropdownButton: DropdownButton<ItemDropdDown>(
                hint: Text("Selecione"),
                items: (listItemsManagement.map((ItemDropdDown e) {
                  return DropdownMenuItem<ItemDropdDown>(
                    child: Text(e.title!.toUpperCase()),
                    value: e,
                  );
                }).toList()),
                isExpanded: true,
                onChanged: (ItemDropdDown? value) async {
                  setState(() {
                    loadingInstallation = true;
                    itemSelectedManagement = value;
                  });
                  await controllerDropDown
                      .getListItensDropDown(endPoint: 'gerencia')
                      .then((list) => listItemDropDown = list);

                  setState(() {
                    validateChildFiltersManagement();

                    loadingInstallation = false;

                    if (value!.id != "0" || value.id != null) {
                      textHintInstallation = "Selecione";
                      loadingInstallation = false;
                    }
                  });
                },
                value: itemSelectedManagement,
              ),
            );
          }
        }),
        //*Fim DropDown Gerência

        if (requiredGerencia == true)
          RequiredInformationDropdown(
            iconeRequired: requiredAsterisk(),
            validatorRequired: "Seleção obrigatória de gerência",
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

        //Início DropdDown Instalação
        Observer(
          builder: (_) {
            if (loadingInstallation == true)
              return CircularProgressIndicator();
            else
              return DropDownItems(
                dropdownButton: DropdownButton<ItemDropdDown>(
                  hint: Text(textHintInstallation),
                  items: (listInstallation.map((ItemDropdDown e) {
                    return DropdownMenuItem<ItemDropdDown>(
                      child: Text(e.title!),
                      value: e,
                    );
                  }).toList()),
                  isExpanded: true,
                  onChanged: (ItemDropdDown? value) async {
                    setState(() {
                      loadingOperationalName = true;
                      itemSelectedInstallation = value;
                    });
                    await controllerDropDown
                        .getListItensDropDown(endPoint: 'gerencia')
                        .then((list) => listItemDropDown = list);
                    setState(() {
                      validateChildFiltersInstallation();

                      if (value!.id != "0" || value.id != null) {
                        textHintOperationalName = "Selecione";
                        itemSelectedOperationalName = null;
                        loadingOperationalName = false;
                      }
                    });
                  },
                  value: itemSelectedInstallation,
                ),
              );
          },
        ),
        //Fim DropdDown Instalação
        if (requiredInstalacao == true)
          RequiredInformationDropdown(
            iconeRequired: requiredAsterisk(),
            validatorRequired: "Seleção obrigatória de instalação",
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
        //Início DropDown Nome Operacional
        Observer(builder: (_) {
          if (loadingOperationalName == true)
            return CircularProgressIndicator();
          else
            return DropDownItems(
              dropdownButton: DropdownButton<ItemDropdDown>(
                hint: Text(
                  textHintOperationalName,
                  style: TextStyle(fontSize: 14),
                ),
                items: (listOperationalName.map((ItemDropdDown e) {
                  return DropdownMenuItem<ItemDropdDown>(
                    child: Text(e.title!),
                    value: e,
                  );
                }).toList()),
                isExpanded: true,
                onChanged: (ItemDropdDown? value) async {
                  setState(() {
                    loadingOperationalCode = true;
                    itemSelectedOperationalName = value;
                  });

                  await controllerDropDown
                      .getListItensDropDown(endPoint: 'gerencia')
                      .then((list) => listItemDropDown = list);
                  setState(() {
                    if (value!.id != "0" || value.id != null) {
                      textHintOperationalCode = "Selecione";
                      itemSelectedOperationalCode = null;
                    }
                    listOperationalCode = listItemDropDown;
                    loadingOperationalCode = false;
                  });
                },
                value: itemSelectedOperationalName,
              ),
            );
        }),
        //Fim DropDown Nome Operacional

        SizedBox(height: 10),

        //Início DropDown Código Operacional
        Observer(builder: (_) {
          if (loadingOperationalCode == true)
            return CircularProgressIndicator();
          else
            return DropDownItems(
              dropdownButton: DropdownButton<ItemDropdDown>(
                hint: Text(textHintOperationalCode),
                items: (listOperationalCode.map((ItemDropdDown e) {
                  return DropdownMenuItem<ItemDropdDown>(
                    child: Text(e.title!),
                    value: e,
                  );
                }).toList()),
                isExpanded: true,
                onChanged: (ItemDropdDown? value) async {
                  setState(() {
                    itemSelectedOperationalCode = value;
                  });
                },
                value: itemSelectedOperationalCode,
              ),
            );
        }),
        //Fim DropDown Código Operacional

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

  validateChildFiltersManagement() {
    if (listInstallation.length > 0) {
      
      listOperationalName = [];
      listOperationalCode = [];

      itemSelectedInstallation = null;
      textHintInstallation = "Selecione";
      textHintOperationalName = "Selecione uma instalação para operacional";
      textHintOperationalCode = "Selecione uma operação para código";

      
    } else {
      listInstallation = listItemDropDown;
    }
  }

  validateChildFiltersInstallation() {
    if (listOperationalName.length > 0) {
      listOperationalCode = [];
      textHintOperationalCode = "Selecione uma operação para código";
    } else {
      listOperationalName = listItemDropDown;
    }
  }

  void _loadSelected() async {
    gerencia = await localStorage.getValor('gerencia');

    if (gerencia != null) {
      print("contem valor gerencia");
    }
  }
}
