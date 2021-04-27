import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/app_dropdown/dialog_alert_component_app.dart';
import 'package:geolocator/geolocator.dart';

class BottomMenuNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF0084c7),
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.calculate),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.calculate),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.room),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.room),
            onPressed: () async {
              bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

              if (!serviceEnabled) if (Platform.isAndroid) {
                bool dialog = await openDialog(
                    contextPage: context,
                    tituloDialog: 'Ativar GPS',
                    textoDialog:
                        'Necessário ativar o GPS, você será redirecionado a configuração para ativa-lo.\n Em seguida, retorne ao aplicativo e tente novamente.');
                if (dialog == false) {
                  Geolocator.openLocationSettings();
                }
              }
              if (serviceEnabled) Navigator.of(context).pushNamed('/map');
            },
          ),
        ],
      ),
    );
    /*return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.calculate), title: Text("PVI")),
      BottomNavigationBarItem(
          icon: Icon(Icons.history), title: Text("Histórico")),
    ]);*/
  }
}
