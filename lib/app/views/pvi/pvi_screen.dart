import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';

class PVIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return templatePage(
        columnSliverContentPage: Column(
      children: [Center(child: Text("Teste PVI"))],
    ));
  }
}
