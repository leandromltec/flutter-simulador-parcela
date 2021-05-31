import 'package:flutter_simulador_parcela/app/models/equipment/equipment.dart';
import 'package:mobx/mobx.dart';

part 'equipment_controller.g.dart';

class EquimentController = _EquimentControllerBase with _$EquimentController;

abstract class _EquimentControllerBase with Store {
  @observable
  /*ObservableList<EquipmentModel> listEquipment =
      [EquipmentModel(titleEquipment: "Teste 1")].asObservable();*/

  @observable
  ObservableList<EquipmentModel> listEquipment =
      ObservableList<EquipmentModel>();

  @action
  addEquipment(EquipmentModel equipmentItem) {
    listEquipment.add(equipmentItem);
    print(listEquipment);
  }
}
