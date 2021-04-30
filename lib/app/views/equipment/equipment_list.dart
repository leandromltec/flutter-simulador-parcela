import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/equipment/components_equipment/equipment_tile.dart';

class EquipmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EquipmentTile(),
      ],
    );
  }
}
