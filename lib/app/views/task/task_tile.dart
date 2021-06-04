import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_simulador_parcela/app/models/task/task.dart';

//https://flutter.dev/docs/release/breaking-changes/scaffold-messenger

class TaskTile extends StatelessWidget {
  final TaskModel itemTask;

  TaskTile({required this.itemTask});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Dismissible(
          key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white)),
          child: ListTile(
              title: Text(
                itemTask.titleTask!,
                style: TextStyle(
                    decoration:
                        itemTask.isDone! ? TextDecoration.lineThrough : null,
                    color: itemTask.isDone! ? Color(0XFF35ced4) : Colors.black),
              ),
              trailing: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: itemTask.isDone!,
                onChanged: (valueChecked) {
                  itemTask.setCheck(valueChecked!);
                },
              )),
          onDismissed: (direction) {
            var snackBar = SnackBar(
              content: Text("Tarefa excluída"),
              action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {},
              ),
              duration: Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
            );
            //Exibição do snack bar com a mensagem de tarefa excluída
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    });
  }
}
