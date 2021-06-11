/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_simulador_parcela/app/controllers/task/task_controller.dart';
import 'package:flutter_simulador_parcela/app/shared/services/share_item_service.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/task/task_add.dart';
import 'package:flutter_simulador_parcela/app/views/task/task_tile.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';
import 'package:intl/intl.dart';


class TaskListScreen extends StatefulWidget {
  String menuId;
  TaskListScreen({required this.menuId});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final controllerTask = TaskController();

  bool containsTask = false;

  @override
  Widget build(BuildContext context) {
    return templatePage(
        selectedItemMenuId: widget.menuId,
        widgetMaster: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              titlePage("Tarefas"),
              dividerSession(),
              if (containsTask == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      width: 200,
                      child: Text(
                        "* Deslize para esquerda para\n excluir uma tarefa",
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFF35ced4),
                          elevation: 3,
                        ),
                        onPressed: () {
                          DateTime dateCurrent = DateTime.now();

                          String listTask = "";

                          var listDone = controllerTask.listTask
                              .where((item) => item.isDone == true)
                              .toList();

                          var listInProgress = controllerTask.listTask
                              .where((item) => item.isDone == false);

                          listTask += "Tarefas cadastradas em " +
                              DateFormat("dd/MM/yyyy").format(dateCurrent) +
                              "\n\n";

                          if (listDone.length > 0) {
                            listTask += "Tarefas Concluídas:\n";

                            for (var itemDone in listDone) {
                              listTask += itemDone.titleTask.toString() + "\n";
                            }
                          }

                          if (listInProgress.length > 0) {
                            listTask += "\nTarefas Em andamento:\n";

                            for (var itemInProgress in listInProgress) {
                              listTask +=
                                  itemInProgress.titleTask.toString() + "\n";
                            }
                          }
                          //Compartilha lista de Tarefas
                          shareItem(
                              context: context,
                              item: listTask,
                              subjectTitle: "Tarefas");
                        },
                        label: Text(
                          "Compartilhar",
                          style: TextStyle(fontSize: 12),
                        ),
                        icon: Icon(
                          Icons.share,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )),
                  child: Stack(
                    children: [
                      if (containsTask == false)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "* Nenhuma tarefa cadastrada",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      Observer(builder: (_) {
                        return ListView.builder(
                            itemCount: controllerTask.listTask.length,
                            itemBuilder: (_, index) {
                              return TaskTile(
                                  itemTask: controllerTask.listTask[index]);
                            });
                      }),
                      Positioned(
                        right: 0.0,
                        bottom: 270,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 180,
                          child: FloatingActionButton.extended(
                              elevation: 3,
                              label: Text(
                                "Incluir tarefa",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              icon: Icon(
                                Icons.add,
                                size: 25,
                              ),
                              backgroundColor: colorBackgroundElevatedButtonApp,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (_) => AddTaskScreen((itemTask) {
                                          controllerTask.addTask(itemTask);
                                          setState(() {
                                            if (controllerTask.listTask.length >
                                                0)
                                              containsTask = true;
                                            else
                                              containsTask = false;
                                          });
                                        }));
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
