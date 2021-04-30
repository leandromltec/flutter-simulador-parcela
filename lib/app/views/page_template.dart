import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/bottom_menu.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/button_home.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/sliverapp.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

Widget templatePage({required Widget columnSliverContentPage}) {
  return Scaffold(
    backgroundColor: backgroundAppColor,
    bottomNavigationBar: BottomMenuNavigation(),
    floatingActionButton: HomeButton(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    body: CustomScrollView(
      slivers: <Widget>[
        AnimatedHeader(),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[columnSliverContentPage]),
        )
      ],
    ),
  );
}
