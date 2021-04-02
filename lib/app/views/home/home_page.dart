/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/home/components_home/button_home_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';

class HomePage extends StatelessWidget {
  /*List<ItemDropdDown> lista = [
    ItemDropdDown(id: 0, title: 'Selecione'),
    ItemDropdDown(id: 1, title: 'Gerência 1'),
    ItemDropdDown(id: 2, title: 'Gerência 2')
  ];*/

  List<String> lista = ["Teste 1", "Teste 2"];

  @override
  Widget build(BuildContext context) {
    return templatePage(
        columnSliverContentPage: Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ButtonHomePages(
          titleButton: "Criar PVI",
          subtitleButton:
              "Criar cálculos de manutenção através de parâmetros inseridos",
          iconButton: Icons.calculate,
          namePage: "pvi",
        ),
        ButtonHomePages(
          titleButton: "Histórico",
          subtitleButton: "Visualize a última realização de cálculo",
          iconButton: Icons.history,
          namePage: "pvi",
        ),
      ],
    ));
  }
}
