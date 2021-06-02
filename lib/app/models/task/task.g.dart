// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskModel on _TaskModelBase, Store {
  final _$titleTaskAtom = Atom(name: '_TaskModelBase.titleTask');

  @override
  String? get titleTask {
    _$titleTaskAtom.reportRead();
    return super.titleTask;
  }

  @override
  set titleTask(String? value) {
    _$titleTaskAtom.reportWrite(value, super.titleTask, () {
      super.titleTask = value;
    });
  }

  final _$isDoneAtom = Atom(name: '_TaskModelBase.isDone');

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

  final _$_TaskModelBaseActionController =
      ActionController(name: '_TaskModelBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_TaskModelBaseActionController.startAction(
        name: '_TaskModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_TaskModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCheck(bool value) {
    final _$actionInfo = _$_TaskModelBaseActionController.startAction(
        name: '_TaskModelBase.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$_TaskModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleTask: ${titleTask},
isDone: ${isDone}
    ''';
  }
}
