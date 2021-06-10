/* Desenvolvido por Leandro M. Loureiro */
/* GitHub https://github.com/leandromltec */
/* Linkedin - https://www.linkedin.com/in/leandro-loureiro-dev/ */

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/home/components_home/button_home_pages.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  /*AnimationController? _animationControllerHelp;
  Animation? _animationHelp;*/

  double heightHero = 0;

  bool _visible = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    //_animationControllerHelp =
    //AnimationController(vsync: this, duration: Duration(seconds: 8));

    _animation = CurvedAnimation(
        parent: _animationController!, curve: Curves.fastOutSlowIn);

    //_animationHelp =
    CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);

    _animationController!.forward();

    // _animationControllerHelp!.forward();

    _animationController!
      ..addListener(() {
        setState(() {
          print("valor " + _animationController!.value.toString());
        });
      });

    //Altera o estado da opacidade
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _visible = !_visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return templatePage(
        widgetMaster: Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Hero(
          tag: 'tag',
          child: ButtonHomePages(
            titleButton: "Criar PVI",
            subtitleButton:
                "Criar cálculos de manutenção através de parâmetros inseridos",
            iconButton: Icons.calculate,
            namePage: "pvi",
            heightHero: _animation!.value * 180,
          ),
        ),
        Hero(
          tag: 'tag1',
          child: ButtonHomePages(
            titleButton: "Histórico",
            subtitleButton: "Visualize a última realização de cálculo",
            iconButton: Icons.history,
            namePage: "pvi",
            heightHero: _animation!.value * 180,
          ),
        ),
        SizedBox(height: 20),
        AnimatedOpacity(
          curve: Curves.linear,
          duration: Duration(seconds: 8),
          opacity: _visible ? 1.0 : 0.0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF0084c7),
                  borderRadius: BorderRadius.circular(50.0)),
              width: 160,
              //height: 100,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.help_outline_sharp,
                      color: Colors.white,
                      size: 40,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0XFF35ced4)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    child: Text(
                      "Ajuda",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
