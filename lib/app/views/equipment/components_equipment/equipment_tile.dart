import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_simulador_parcela/app/models/equipment/equipment.dart';

class EquipmentTile extends StatelessWidget {
  final EquipmentModel itemEquipment;

  EquipmentTile({required this.itemEquipment});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListTile(
            title: Text(
              itemEquipment.titleEquipment!,
              style: TextStyle(
                  decoration: itemEquipment.isDone!
                      ? TextDecoration.lineThrough
                      : null),
            ),
            trailing: Checkbox(
              activeColor: Colors.lightBlueAccent,
              value: itemEquipment.isDone!,
              onChanged: (valueChecked) {
                itemEquipment.setCheck(valueChecked!);
              },
            )),
      );
    });
  }
}
