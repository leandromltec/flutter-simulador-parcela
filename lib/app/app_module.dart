/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_simulador_parcela/app/app_widget.dart';
import 'package:flutter_simulador_parcela/app/views/home/home_page.dart';
import 'package:flutter_simulador_parcela/app/views/map/map_screen.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/pvi_results_filter/pvi_results_filter_screen.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/pvi_screen.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/pvi_time_course.dart/pvi_time_course_screen.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ChildRoute('/map', child: (_, args) => MapScreen()),
    ChildRoute('/pvi', child: (_, args) => PVIScreen()),
    ChildRoute('/pvi/resultado', child: (_, args) => PVIResultsFilterPVI()),
    ChildRoute('/pvi/time', child: (_, args) => PVITimeCourseScreen()),
  ];

  final Widget boostrap = AppWidget();
}
