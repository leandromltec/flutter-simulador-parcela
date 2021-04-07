// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pvi_filtros_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerPviFiltros on _ControllerPviFiltros, Store {
  final _$listAtom = Atom(name: '_ControllerPviFiltros.list');

  @override
  ObservableFuture<List<ItemDropdDown>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableFuture<List<ItemDropdDown>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getListItensDropDownAsyncAction =
      AsyncAction('_ControllerPviFiltros.getListItensDropDown');

  @override
  Future<List<ItemDropdDown>> getListItensDropDown() {
    return _$getListItensDropDownAsyncAction
        .run(() => super.getListItensDropDown());
  }

  final _$_ControllerPviFiltrosActionController =
      ActionController(name: '_ControllerPviFiltros');

  @override
  dynamic loadItemsDropDown() {
    final _$actionInfo = _$_ControllerPviFiltrosActionController.startAction(
        name: '_ControllerPviFiltros.loadItemsDropDown');
    try {
      return super.loadItemsDropDown();
    } finally {
      _$_ControllerPviFiltrosActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
