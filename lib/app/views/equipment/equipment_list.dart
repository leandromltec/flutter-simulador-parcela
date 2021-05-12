import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/models/equipment/equipment.dart';
import 'package:flutter_simulador_parcela/app/models/equipment/equipment_data.dart';
import 'package:flutter_simulador_parcela/app/views/equipment/components_equipment/equipment_tile.dart';
import 'package:provider/provider.dart';

class EquipmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EquipmentData>(builder: (context, equipmentData, child) {
      return ListView.builder(
          itemCount: equipmentData.listEquipmentCount,
          itemBuilder: (context, index) {
            return EquipmentTile(
                isChecked: equipmentData.listEquipment[index].isDone,
                equipmentTitle:
                    equipmentData.listEquipment[index].name.toString(),
                checkboxCallback: (checkBoxState) {
                  /*  setState(() {
                    Provider.of<EquipmentData>(context)
                        .listEquipment[index]
                        .toggleDone();
                  }); */
                });
          });
    });
  }
}
