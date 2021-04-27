import 'package:flutter/material.dart';

Future<bool> openDialog(
    {required BuildContext contextPage,
    required String tituloDialog,
    required String textoDialog}) async {
  return showDialog(
      context: contextPage,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            tituloDialog,
            style: TextStyle(fontSize: 12.0),
          ),
          content: Container(
            child: Text(textoDialog),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }).then((value) => value != null ? true : false);
}
