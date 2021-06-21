import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  bool changeSuffixIcon = true;
  IconData? suffixIcon = FontAwesomeIcons.eye;

  bool obscureText = true;

  bool isLoading = false;

  String textButtonAcess = "Entrar";

  bool _visible = false;

  Color colorButtonEnter = Colors.white;
  Color textButtonEnter = Color(0xFF0084c7);

  TextEditingController controllerLogin = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.linear);

    _animationController!.forward();

    _animationController!
      ..addListener(() {
        setState(() {});
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
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 2],
              colors: [Color(0xFF0084c7), Color(0XFF35ced4)]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textFormFieldLogin(
                context: context,
                formKey: "Login",
                controller: controllerLogin,
                labelText: "Digite seu e-mail",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: FontAwesomeIcons.userAlt),
            textFormFieldLogin(
              context: context,
              controller: controllerPassword,
              formKey: "Senha",
              labelText: "Digite sua senha",
              keyboardType: TextInputType.text,
              prefixIcon: FontAwesomeIcons.key,
              constainsSuffixIcon: true,
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: buttonEnter(),
              onTap: () {
                setState(() {
                  isLoading = true;
                  textButtonEnter = Colors.white;
                  colorButtonEnter = Color(0XFF35ced4);
                  textButtonAcess = "Aguarde...";
                });
              },
            ),
            SizedBox(height: 50),
            buttonHelp(),
          ],
        ),
      ),
    );
  }

  Widget textFormFieldLogin({
    required BuildContext context,
    required String formKey,
    required TextEditingController controller,
    required String labelText,
    required TextInputType keyboardType,
    required IconData prefixIcon,
    bool? constainsSuffixIcon,
  }) {
    return Container(
      height: 100,
      width: _animation!.value * MediaQuery.of(context).size.width,
      color: Colors.transparent,
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.all(5),
      child: TextFormField(
        key: Key(formKey),
        controller: controller,
        obscureText: formKey == "Senha" ? obscureText : false,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF0084c7)),
                child: Icon(
                  prefixIcon,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
            suffixIcon: constainsSuffixIcon != null
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        if (controller.text.isNotEmpty) {
                          changeSuffixIcon = !changeSuffixIcon;

                          if (changeSuffixIcon == true) {
                            obscureText = true;
                            suffixIcon = FontAwesomeIcons.eye;
                          } else {
                            obscureText = false;
                            suffixIcon = FontAwesomeIcons.eyeSlash;
                          }
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFF0084c7)),
                        child: Icon(
                          suffixIcon,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : null,
            fillColor: Color(0XFF35ced4),
            filled: true,
            contentPadding: EdgeInsets.all(20),
            hintStyle: TextStyle(color: Color(0xFF0084c7)),
            focusColor: Color(0xFF0084c7),
            errorStyle: TextStyle(color: Colors.redAccent),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0084c7)),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0084c7)),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            labelStyle: TextStyle(color: Colors.white),
            labelText: labelText),
      ),
    );
  }

  Widget buttonHelp() {
    return AnimatedOpacity(
      curve: Curves.linear,
      duration: Duration(seconds: 4),
      opacity: !_visible ? 0.0 : 1.0,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(left: 65, right: 65),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.white),
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "Esqueceu sua senha ou login ? 🤔",
              style: TextStyle(
                  color: Color(0xFF0084c7),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )),
      ),
    );
  }

  Widget buttonEnter() {
    return AnimatedOpacity(
      curve: Curves.linear,
      duration: Duration(seconds: 4),
      opacity: !_visible ? 0.0 : 1.0,
      child: Container(
        height: 60,
        margin: EdgeInsets.only(left: 50, right: 50),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: colorButtonEnter),
        child: Row(
          children: [
            if (isLoading)
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(left: 20),
                child: CircularProgressIndicator(),
              ),
            if (!isLoading)
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  FontAwesomeIcons.signInAlt,
                  color: Colors.white,
                  size: 30,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF0084c7)),
              ),
            Container(
                width: 200,
                child: Center(
                    child: Text(
                  textButtonAcess,
                  style: TextStyle(
                      color: textButtonEnter,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )))
          ],
        ),
      ),
    );
  }
}
