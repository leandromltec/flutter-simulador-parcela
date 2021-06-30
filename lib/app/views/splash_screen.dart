import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simulador_parcela/app/shared/constants/routes_screens_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushNamed(RouteScreen.homeScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/ic_launcher_splash.jpg'))),
      ),
    );
  }
}
