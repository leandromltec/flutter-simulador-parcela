import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      child: FloatingActionButton(
          tooltip: "Home",
          backgroundColor: colorBackgroundButtonHome,
          child: Container(
            width: 50,
            height: 50,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/icon_button_home.png'),
            ),
          ),
          onPressed: () => Navigator.of(context).pushNamed('/')),
    );
  }
}
