// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EquipmentModel on _EquipmentModelBase, Store {
  final _$titleEquipmentAtom = Atom(name: '_EquipmentModelBase.titleEquipment');

  @override
  String? get titleEquipment {
    _$titleEquipmentAtom.reportRead();
    return super.titleEquipment;
  }

  @override
  set titleEquipment(String? value) {
    _$titleEquipmentAtom.reportWrite(value, super.titleEquipment, () {
      super.titleEquipment = value;
    });
  }

  final _$isDoneAtom = Atom(name: '_EquipmentModelBase.isDone');

  @override
  bool? get isDone {
    _$isDoneAtom.reportRead();
    return super.isDone;
  }

  @override
  set isDone(bool? value) {
    _$isDoneAtom.reportWrite(value, super.isDone, () {
      super.isDone = value;
    });
  }

  final _$_EquipmentModelBaseActionController =
      ActionController(name: '_EquipmentModelBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_EquipmentModelBaseActionController.startAction(
        name: '_EquipmentModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_EquipmentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCheck(bool value) {
    final _$actionInfo = _$_EquipmentModelBaseActionController.startAction(
        name: '_EquipmentModelBase.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$_EquipmentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleEquipment: ${titleEquipment},
isDone: ${isDone}
    ''';
  }
}
