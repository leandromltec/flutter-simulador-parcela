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
      actions: [
        Align(
          alignment: Alignment.centerRight,

          child: Container(
            margin: EdgeInsets.only(
              right: 20,
              top: 20,
            ),
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                icon: Icon(Icons.account_circle_rounded),
                style: ElevatedButton.styleFrom(primary: Color(0xFF0084c7)),
                label: Text("Entrar")),
          ),
        )
      ],
      expandedHeight: 100.0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "Simulador \nParcela Variável",
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
        titlePadding: EdgeInsetsDirectional.only(start: 50, bottom: 10),
        collapseMode: CollapseMode.parallax,
        background: Image.asset(
          'assets/images/background_sliverapp.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

Widget sliverAnimatedHeader({required Column widgetMaster}) {
  return Scaffold(
    backgroundColor: backgroundAppColor,
    bottomNavigationBar: BottomMenuNavigation(),
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
