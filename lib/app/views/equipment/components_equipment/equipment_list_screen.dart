import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_simulador_parcela/app/controllers/equipment/equipment_controller.dart';
import 'package:flutter_simulador_parcela/app/models/equipment/equipment.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/equipment/components_equipment/equipment_add.dart';
import 'package:flutter_simulador_parcela/app/views/equipment/components_equipment/equipment_tile.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';
import 'package:share/share.dart';

//https://pub.dev/packages/share

class EquipmentListScreen extends StatefulWidget {
  String menuId;
  EquipmentListScreen({required this.menuId});

  @override
  _EquipmentListScreenState createState() => _EquipmentListScreenState();
}

class _EquipmentListScreenState extends State<EquipmentListScreen> {
  final controllerEquipment = EquimentController();

  bool containsEquipment = false;

  @override
  Widget build(BuildContext context) {
    return templatePage(
        selectedItemMenuId: widget.menuId,
        columnSliverContentPage: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              titlePage("Tarefas"),
              dividerSession(),
              if (containsEquipment == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      width: 200,
                      child: Text(
                        "* Deslize para esquerda para\n excluir uma tarefa",
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFF35ced4),
                          elevation: 3,
                        ),
                        onPressed: () {
                          final teste = "Teste 1";
                          EquipmentModel tarefa =
                              EquipmentModel(titleEquipment: "Teste novo");
                          final RenderBox box =
                              context.findRenderObject() as RenderBox;
                          Share.share(teste,
                              subject: tarefa.titleEquipment,
                              sharePositionOrigin:
                                  box.localToGlobal(Offset.zero) & box.size);
                        },
                        label: Text(
                          "Compartilhar",
                          style: TextStyle(fontSize: 12),
                        ),
                        icon: Icon(
                          Icons.share,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: Stack(
                    children: [
                      if (containsEquipment == false)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "* Nenhuma tarefa cadastrada",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      Observer(builder: (_) {
                        return ListView.builder(
                            itemCount: controllerEquipment.listEquipment.length,
                            itemBuilder: (_, index) {
                              return EquipmentTile(
                                  itemEquipment:
                                      controllerEquipment.listEquipment[index]);
                            });
                      }),
                      Positioned(
                        right: 0.0,
                        bottom: 270,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 180,
                          child: FloatingActionButton.extended(
                              elevation: 3,
                              label: Text(
                                "Incluir tarefa",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              icon: Icon(
                                Icons.add,
                                size: 25,
                              ),
                              backgroundColor: colorBackgroundElevatedButtonApp,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (_) =>
                                        AddEquipmentScreen((itemEquipment) {
                                          controllerEquipment
                                              .addEquipment(itemEquipment);
                                          setState(() {
                                            if (controllerEquipment
                                                    .listEquipment.length >
                                                0)
                                              containsEquipment = true;
                                            else
                                              containsEquipment = false;
                                          });
                                        }));
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
