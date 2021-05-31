

/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

//https://flutter.dev/docs/development/accessibility-and-localization/internationalization

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [Locale("pt", "BR")],
      debugShowCheckedModeBanner: false,
      title: 'Simulador de Parcela Variável',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
    ).modular();
  }
}
