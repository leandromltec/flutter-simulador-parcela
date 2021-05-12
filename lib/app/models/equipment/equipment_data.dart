import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'equipment.dart';

class EquipmentData extends ChangeNotifier {
  List<Equipment> listEquipment = [
    Equipment(name: 'Equipamento 1'),
    Equipment(name: 'Equipamento 2'),
    Equipment(name: 'Equipamento 3'),
  ];

  /*UnmodifiableListView<Equipment> get equipmentItems {
    return UnmodifiableListView(_listEquipment);
  }*/

  int get listEquipmentCount {
    return listEquipment.length;
  }

  void addEquipment(String titleEquipment) {
    final equipment = Equipment(name: titleEquipment);
    listEquipment.add(equipment);
    notifyListeners();
  }
}
