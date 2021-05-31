import 'package:mobx/mobx.dart';

part 'equipment.g.dart';

class EquipmentModel = _EquipmentModelBase with _$EquipmentModel;

abstract class _EquipmentModelBase with Store {
  _EquipmentModelBase({this.titleEquipment, this.isDone = false});

  @observable
  String? titleEquipment;

  @observable
  bool? isDone;

  @action
  setTitle(String value) => titleEquipment = value;

  @action
  setCheck(bool value) => isDone = value;
}
