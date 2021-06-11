import 'package:flutter_simulador_parcela/app/models/task/task.dart';
import 'package:mobx/mobx.dart';

part 'task_controller.g.dart';

class TaskController = _TaskControllerBase with _$TaskController;

abstract class _TaskControllerBase with Store {
  @observable
  ObservableList<TaskModel> listTask = ObservableList<TaskModel>();

  @action
  addTask(TaskModel taskItem) {
    listTask.add(taskItem);
  }

  @computed
  int get taskFinisehd => listTask.where((item) => item.isDone == true).length;

  @action
  removeTask(TaskModel taskItem) {
    listTask.removeWhere((item) => item.titleTask == taskItem.titleTask);
  }
}
