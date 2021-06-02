import 'package:mobx/mobx.dart';

part 'task.g.dart';

class TaskModel = _TaskModelBase with _$TaskModel;

abstract class _TaskModelBase with Store {
  _TaskModelBase({this.titleTask, this.isDone = false});

  @observable
  String? titleTask;

  @observable
  bool? isDone;

  @action
  setTitle(String value) => titleTask = value;

  @action
  setCheck(bool value) => isDone = value;
}
