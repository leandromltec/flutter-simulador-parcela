import 'package:flutter/material.dart';

class UIHelper {
  static Future<void> showDialogError(
      {required BuildContext context,
      required String titleError,
      required String messageError}) async {
    await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(titleError),
            content: Text(messageError),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Fechar"))
            ],
          );
        });
  }
}
