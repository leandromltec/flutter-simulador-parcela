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

  AnimationController? _animationControllerHelp;
  Animation? _animationHelp;

  double heightHero = 0;

  bool _visible = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));

    _animationControllerHelp =
        AnimationController(vsync: this, duration: Duration(seconds: 8));

    _animation = CurvedAnimation(
        parent: _animationController!, curve: Curves.fastOutSlowIn);

    _animationHelp =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);

    _animationController!.forward();

    _animationControllerHelp!.forward();

    _animationController!
      ..addListener(() {
        setState(() {
          print(_animationController);
          //heightHero = _animation!.value * 180;
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
        columnSliverContentPage: Column(
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
        ButtonHomePages(
          titleButton: "Histórico",
          subtitleButton: "Visualize a última realização de cálculo",
          iconButton: Icons.history,
          namePage: "pvi",
          heightHero: _animation!.value * 180,
        ),
        SizedBox(height: 20),
        AnimatedOpacity(
          curve: Curves.linear,
          duration: Duration(seconds: 8),
          opacity: _visible ? 1.0 : 0.0,
          child: Center(
            child: Container(
              width: 200,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      ],
    ));
  }
}



/*class HomePage extends StatelessWidget {
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
        AnimatedContainer(
          duration: Duration(seconds: 1),
          color: Colors.red,
          height: _statusButtonsHomeAnimation
              ? 0
              : MediaQuery.of(context).size.height / 2,
          child: Column(
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
          ),
        ),
      ],
    ));
  }
}*/
