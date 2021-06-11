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
  int get taskCompleted => listTask.where((item) => item.isDone == true).length;

   @computed
  int get taskInProgress => listTask.where((item) => item.isDone == false).length;

  @action
  removeTask(TaskModel taskItem) {
    listTask.removeWhere((item) => item.titleTask == taskItem.titleTask);
  }
}
