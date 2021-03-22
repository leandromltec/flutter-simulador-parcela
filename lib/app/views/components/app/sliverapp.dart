/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/bottom_menu.dart';
import 'package:flutter_simulador_parcela/app/views/components/app/button_home.dart';
import 'package:flutter_simulador_parcela/app/views/themes/colors.dart';

class AnimatedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //Remove o botão voltar na navegação de telas
      automaticallyImplyLeading: false,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "Simulador \nParcela Variável",
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        titlePadding: EdgeInsetsDirectional.only(start: 50, bottom: 60),
        collapseMode: CollapseMode.parallax,
        background: Image.asset(
          'assets/images/background_sliverapp.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

Widget sliverAnimatedHeader({required Column columnSliverContentPage}) {
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
