import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

class ButtonHomePages extends StatefulWidget {
  String titleButton;
  String subtitleButton;
  IconData iconButton;
  String namePage;

  ButtonHomePages(
      {required this.titleButton,
      required this.subtitleButton,
      required this.iconButton,
      required this.namePage});

  @override
  _ButtonHomePagesState createState() => _ButtonHomePagesState();
}

class _ButtonHomePagesState extends State<ButtonHomePages> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 40.0, top: 10, right: 40.0, bottom: 10),
        width: double.infinity,
        child: Card(
          color: colorBackgroundButtonHome,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("/" + widget.namePage);
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          color: colorBackgroundIcon,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Icon(
                        widget.iconButton,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                      child: Text(
                    widget.titleButton,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                  subtitle: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      widget.subtitleButton,
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
