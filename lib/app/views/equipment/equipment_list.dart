import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_simulador_parcela/app/controllers/equipment/equipment_controller.dart';
import 'package:flutter_simulador_parcela/app/views/equipment/components_equipment/equipment_tile.dart';


class EquipmentList extends StatefulWidget {
  @override
  _EquipmentListState createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  final controllerEquipment = EquimentController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          itemCount: controllerEquipment.listEquipment.length,
          itemBuilder: (context, index) {
            return EquipmentTile(
                itemEquipment: controllerEquipment.listEquipment[index]);
          });
    });
  }
}
