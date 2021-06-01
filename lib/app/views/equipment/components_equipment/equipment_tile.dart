import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_simulador_parcela/app/models/equipment/equipment.dart';

//https://flutter.dev/docs/release/breaking-changes/scaffold-messenger

class EquipmentTile extends StatelessWidget {
  final EquipmentModel itemEquipment;

  EquipmentTile({required this.itemEquipment});

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
                itemEquipment.titleEquipment!,
                style: TextStyle(
                    decoration: itemEquipment.isDone!
                        ? TextDecoration.lineThrough
                        : null),
              ),
              trailing: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: itemEquipment.isDone!,
                onChanged: (valueChecked) {
                  itemEquipment.setCheck(valueChecked!);
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
