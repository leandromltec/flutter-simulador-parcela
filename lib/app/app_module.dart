/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_simulador_parcela/app/app_widget.dart';
import 'package:flutter_simulador_parcela/app/controllers/task/task_controller.dart';
import 'package:flutter_simulador_parcela/app/views/about/about_screen.dart';
import 'package:flutter_simulador_parcela/app/views/camera/camera.dart';

import 'package:flutter_simulador_parcela/app/views/camera/camera_screen.dart';
import 'package:flutter_simulador_parcela/app/views/login/login_screen.dart';
import 'package:flutter_simulador_parcela/app/views/splash_screen.dart';
import 'package:flutter_simulador_parcela/app/views/task/task_list_screen.dart';
import 'package:flutter_simulador_parcela/app/views/home/home_page.dart';
import 'package:flutter_simulador_parcela/app/views/map/map_screen.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/pvi_results_filter/pvi_results_filter_screen.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/pvi_screen.dart';
import 'package:flutter_simulador_parcela/app/views/pvi/pvi_time_course.dart/pvi_time_course_screen.dart';

import 'controllers/pvi/pvi_controller.dart';
import 'repositories/pvi/pvi_filtros_repositories.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ControllerPVI(repository: i.get<PVIRepository>())),
    Bind((i) => PVIRepository()),
    Bind((i) => TaskController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashScreen()),
    ChildRoute('/home', child: (_, args) => HomePage()),
    ChildRoute('/login', child: (_, args) => LoginScreen()),
    ChildRoute('/map/:menuId',
        child: (_, args) => MapScreen(menuId: args.params["menuId"])),
    ChildRoute('/task/:menuId',
        child: (_, args) => TaskListScreen(menuId: args.params["menuId"])),
    ChildRoute('/pvi', child: (_, args) => PVIScreen()),
    ChildRoute('/pvi/resultado', child: (_, args) => PVIResultsFilterPVI()),
    ChildRoute('/pvi/time', child: (_, args) => PVITimeCourseScreen()),
    ChildRoute('/camera/:menuId',
        child: (_, args) => CameraScreen(menuId: args.params["menuId"])),
    ChildRoute("/camera/component", child: (_, args) => CameraComponent()),
    ChildRoute("/about/:menuId",
        child: (_, args) => AboutScreen(menuId: args.params["menuId"]))
  ];

  final Widget boostrap = AppWidget();
}
