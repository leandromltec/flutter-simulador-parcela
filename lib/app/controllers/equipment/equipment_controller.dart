import 'package:flutter_simulador_parcela/app/models/equipment/equipment.dart';
import 'package:mobx/mobx.dart';

part 'equipment_controller.g.dart';

class EquimentController = _EquimentControllerBase with _$EquimentController;

abstract class _EquimentControllerBase with Store {

  


  @observable
  ObservableList<EquipmentModel> listEquipment = [
    EquipmentModel(titleEquipment: "Equipamento 21", isDone: false)
  ].asObservable();

  @action
  addEquipment(EquipmentModel equipmentItem) {
    listEquipment.add(equipmentItem);
  }
}
