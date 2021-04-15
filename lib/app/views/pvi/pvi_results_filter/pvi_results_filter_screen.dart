import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/button_app.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/divider.dart';
import 'package:flutter_simulador_parcela/app/views/components/app_components/title_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/pvi_results_filter/pvi_results_filter_components.dart';

class PVIResultsFilterPVI extends StatefulWidget {
  @override
  _PVIResultsFilterPVIState createState() => _PVIResultsFilterPVIState();
}

class _PVIResultsFilterPVIState extends State<PVIResultsFilterPVI> {
  @override
  Widget build(BuildContext context) {
    return templatePage(
        columnSliverContentPage: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titlePage("Resultado filtros PVI"),
        dividerSession(),
        titleResultFilter(title: "Módulo"),
        resultTextFilter(resultText: "MD - Referente a gerência 1 (MDG1)"),
        SizedBox(height: 25),
        titleResultFilter(title: "Empresa 1"),
        resultTextFilter(resultText: "EMP - 1 (MD/G1)"),
        SizedBox(height: 25),
        titleResultFilter(title: "Empresa 2"),
        resultTextFilter(
            resultText:
                "EMP - Empresa de representação gerência 2 (MD/G1) EMP - Empresa de representação gerência 2 (MD/G1)"),
        SizedBox(height: 25),
        titleResultFilter(title: "ONN"),
        resultTextFilter(resultText: "MD - EMP1 (G1)"),
        SizedBox(height: 25),
        titleResultFilter(title: "Valor"),
        resultTextFilter(resultText: "R\$ 2565688"),
        SizedBox(height: 40),
        selectedFiltersArea(
            installation: "Instalação 1",
            management: "Gerência 1",
            operation: "Operação 1",
            operationCode: "Código Operação 1"),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 50),
          child: elevatedButton(
              titleButton: 'Período',
              iconButton: Icons.timer,
              onPressedFunction: () {
                //if (requiredNomeOperacional == true)
                Navigator.of(context).pushNamed('/pvi/filtros');
              }),
        ),
      ],
    ));
  }
}
