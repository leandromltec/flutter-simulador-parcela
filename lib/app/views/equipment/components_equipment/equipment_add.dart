import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/controllers/equipment/equipment_controller.dart';
import 'package:flutter_simulador_parcela/app/models/equipment/equipment.dart';

class AddEquipmentScreen extends StatefulWidget {
  final Function? addEquipmentCallBack;

  AddEquipmentScreen(this.addEquipmentCallBack);

  @override
  _AddEquipmentScreenState createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  final controllerEquipment = EquimentController();

  var itemEquipment = EquipmentModel();

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
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  itemEquipment.titleEquipment = value;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    autofocus: true,
                    onPressed: () {
                      widget.addEquipmentCallBack!(itemEquipment);
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
