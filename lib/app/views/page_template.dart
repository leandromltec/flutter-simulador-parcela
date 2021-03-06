import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/bottom_menu.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/button_home.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/sliverapp.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

Widget templatePage(
    {required Widget widgetMaster, String? selectedItemMenuId}) {
  return Scaffold(
    backgroundColor: backgroundAppColor,
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: BottomMenuNavigation(
      selectedItemMenu: selectedItemMenuId,
    ),
    floatingActionButton: HomeButton(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    body: CustomScrollView(
      slivers: <Widget>[
        AnimatedHeader(),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[widgetMaster]),
        )
      ],
    ),
  );
}
