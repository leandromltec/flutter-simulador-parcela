// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pvi_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerPVI on _ControllerPVI, Store {
  final _$listItemsDropdDownAtom =
      Atom(name: '_ControllerPVI.listItemsDropdDown');

  @override
  ObservableFuture<List<ItemDropdDown>>? get listItemsDropdDown {
    _$listItemsDropdDownAtom.reportRead();
    return super.listItemsDropdDown;
  }

  @override
  set listItemsDropdDown(ObservableFuture<List<ItemDropdDown>>? value) {
    _$listItemsDropdDownAtom.reportWrite(value, super.listItemsDropdDown, () {
      super.listItemsDropdDown = value;
    });
  }

  final _$getListItensDropDownAsyncAction =
      AsyncAction('_ControllerPVI.getListItensDropDown');

  @override
  Future<List<ItemDropdDown>> getListItensDropDown({required String endPoint}) {
    return _$getListItensDropDownAsyncAction
        .run(() => super.getListItensDropDown(endPoint: endPoint));
  }

  final _$_ControllerPVIActionController =
      ActionController(name: '_ControllerPVI');

  @override
  dynamic getListItensDropDownManagement() {
    final _$actionInfo = _$_ControllerPVIActionController.startAction(
        name: '_ControllerPVI.getListItensDropDownManagement');
    try {
      return super.getListItensDropDownManagement();
    } finally {
      _$_ControllerPVIActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItemsDropdDown: ${listItemsDropdDown}
    ''';
  }
}
