import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simulador_parcela/app/controllers/task/task_controller.dart';
import 'package:flutter_simulador_parcela/app/models/task/task.dart';

class AddTaskScreen extends StatefulWidget {
  final Function? addTaskCallBack;

  AddTaskScreen(this.addTaskCallBack);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controllerTask = TaskController();

  var itemTask = TaskModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 20),
                    child: ElevatedButton.icon(
                      label: Text(
                        "Fechar",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      icon: Icon(
                        Icons.close,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text('Adicionar tarefa',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  maxLength: 60,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    hintText: "Digite a tarefa (max. 60 caractéres)",
                  ),
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    itemTask.titleTask = value;
                  },
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    autofocus: true,
                    onPressed: () {
                      widget.addTaskCallBack!(itemTask);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 200,
                      child: Center(
                          child: Text("Adicionar",
                              style: TextStyle(fontSize: 16.0))),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
