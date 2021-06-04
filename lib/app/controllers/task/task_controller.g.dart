// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskController on _TaskControllerBase, Store {
  final _$listTaskAtom = Atom(name: '_TaskControllerBase.listTask');

  @override
  ObservableList<TaskModel> get listTask {
    _$listTaskAtom.reportRead();
    return super.listTask;
  }

  @override
  set listTask(ObservableList<TaskModel> value) {
    _$listTaskAtom.reportWrite(value, super.listTask, () {
      super.listTask = value;
    });
  }

  final _$_TaskControllerBaseActionController =
      ActionController(name: '_TaskControllerBase');

  @override
  dynamic addTask(TaskModel TaskItem) {
    final _$actionInfo = _$_TaskControllerBaseActionController.startAction(
        name: '_TaskControllerBase.addTask');
    try {
      return super.addTask(TaskItem);
    } finally {
      _$_TaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTask: ${listTask}
    ''';
  }
}
