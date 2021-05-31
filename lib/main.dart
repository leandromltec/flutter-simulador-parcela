

/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

//https://pub.dev/packages/device_preview

//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_simulador_parcela/app/app_widget.dart';
import 'package:flutter_simulador_parcela/app/app_module.dart';

void main() {
  //Garante que os serviços de plugins sejam inicializados
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(/*DevicePreview(
      enabled: false,
      builder: (context) =>*/
      ModularApp(module: AppModule(), child: AppWidget()));
}
