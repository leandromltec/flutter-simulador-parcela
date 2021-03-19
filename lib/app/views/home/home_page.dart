/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/sliverapp.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return sliverAnimatedHeader(
        columnSliverContentPage: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [Text("Teste")],
    ));
  }
}
