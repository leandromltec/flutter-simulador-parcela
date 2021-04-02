/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

//https://pub.dev/packages/device_preview

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_simulador_parcela/app/app_widget.dart';
import 'package:flutter_simulador_parcela/app/app_module.dart';

void main() {
  runApp(DevicePreview(
      enabled: false,
      builder: (context) =>
          ModularApp(module: AppModule(), child: AppWidget())));
}
