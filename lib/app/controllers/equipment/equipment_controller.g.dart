// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EquimentController on _EquimentControllerBase, Store {
  final _$listEquipmentAtom =
      Atom(name: '_EquimentControllerBase.listEquipment');

  @override
  ObservableList<EquipmentModel> get listEquipment {
    _$listEquipmentAtom.reportRead();
    return super.listEquipment;
  }

  @override
  set listEquipment(ObservableList<EquipmentModel> value) {
    _$listEquipmentAtom.reportWrite(value, super.listEquipment, () {
      super.listEquipment = value;
    });
  }

  final _$_EquimentControllerBaseActionController =
      ActionController(name: '_EquimentControllerBase');

  @override
  dynamic addEquipment(EquipmentModel equipmentItem) {
    final _$actionInfo = _$_EquimentControllerBaseActionController.startAction(
        name: '_EquimentControllerBase.addEquipment');
    try {
      return super.addEquipment(equipmentItem);
    } finally {
      _$_EquimentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listEquipment: ${listEquipment}
    ''';
  }
}
