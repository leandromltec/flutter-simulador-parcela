import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool changeSuffixIcon = true;

  bool obscureText = true;

  IconData? suffixIcon = FontAwesomeIcons.eye;

  bool isLoading = false;

  String textButtonAcess = "Entrar";

  TextEditingController controllerLogin = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

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
              constaisSuffixIcon: true,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;

                  textButtonAcess = "Aguarde...";
                });
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(left: 50, right: 50),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0XFF35ced4)),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(left: 10),
                      child:  
                      Icon(
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )))
                  ],
                ),
              ),
            )
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
    bool? constaisSuffixIcon,
  }) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
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
            suffixIcon: constaisSuffixIcon != null
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
}
