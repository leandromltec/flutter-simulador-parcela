/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  ThemeApp(this.context);

  final BuildContext context;

  ThemeData get defaulTheme => ThemeData(
        primaryColor: Colors.grey[200],
        //secondaryHeaderColor: Color(0XFF894da5),
        //cardColor: Color(0XFF894da5),
      );
}
