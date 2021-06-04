import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/app_dropdown/dialog_alert_component_app.dart';
import 'package:geolocator/geolocator.dart';

class BottomMenuNavigation extends StatefulWidget {
  String? selectedItemMenu;

  BottomMenuNavigation({this.selectedItemMenu});

  @override
  _BottomMenuNavigationState createState() => _BottomMenuNavigationState();
}

class _BottomMenuNavigationState extends State<BottomMenuNavigation> {
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
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  color: widget.selectedItemMenu == "1"
                      ? Colors.white
                      : Color(0xFF0084c7),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.list_alt,
                        color: widget.selectedItemMenu == "1"
                            ? Color(0xFF0084c7)
                            : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.selectedItemMenu = "1";
                        });
                        Navigator.of(context)
                            .pushNamed('/task/${widget.selectedItemMenu}');
                      },
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text("Tarefas",
                          style: TextStyle(
                              color: widget.selectedItemMenu == "1"
                                  ? Color(0xFF0084c7)
                                  : Colors.white,
                              fontSize: 12)))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  color: widget.selectedItemMenu == "2"
                      ? Colors.white
                      : Color(0xFF0084c7),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(right: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: widget.selectedItemMenu == "2"
                            ? Color(0xFF0084c7)
                            : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.selectedItemMenu = "2";
                        });

                        Navigator.of(context)
                            .pushNamed('/camera/${widget.selectedItemMenu}');
                      },
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text("Foto",
                          style: TextStyle(
                              color: widget.selectedItemMenu == "2"
                                  ? Color(0xFF0084c7)
                                  : Colors.white,
                              fontSize: 12)))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  color: widget.selectedItemMenu == "3"
                      ? Colors.white
                      : Color(0xFF0084c7),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.only(left: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.room,
                        color: widget.selectedItemMenu == "3"
                            ? Color(0xFF0084c7)
                            : Colors.white,
                        size: 30,
                      ),
                      onPressed: () async {
                        setState(() {
                          widget.selectedItemMenu = "3";
                        });
                        bool serviceEnabled =
                            await Geolocator.isLocationServiceEnabled();

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
                        if (serviceEnabled)
                          Navigator.of(context)
                              .pushNamed('/map/${widget.selectedItemMenu}');
                      },
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text("Estação",
                          style: TextStyle(
                              color: widget.selectedItemMenu == "4"
                                  ? Color(0xFF0084c7)
                                  : Colors.white,
                              fontSize: 12)))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  color: widget.selectedItemMenu == "5"
                      ? Colors.white
                      : Color(0xFF0084c7),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.info,
                        color: widget.selectedItemMenu == "5"
                            ? Color(0xFF0084c7)
                            : Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.selectedItemMenu = "5";
                        });
                        Navigator.of(context)
                            .pushNamed('/about/${widget.selectedItemMenu}');
                      },
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text("Sobre",
                          style: TextStyle(
                              color: widget.selectedItemMenu == "5"
                                  ? Color(0xFF0084c7)
                                  : Colors.white,
                              fontSize: 12)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
