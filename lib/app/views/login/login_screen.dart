import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool changeSuffixIcon = true;

  IconData? suffixIcon;

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
                labelText: "Digite seu e-mail",
                keyboardType: TextInputType.emailAddress,
                obscureTextPassword: false,
                prefixIcon: FontAwesomeIcons.userAlt),
            textFormFieldLogin(
                context: context,
                labelText: "Digite sua senha",
                keyboardType: TextInputType.text,
                obscureTextPassword: true,
                prefixIcon: FontAwesomeIcons.key,
                suffixIcon: suffixIcon,
                suffixIconFuncion: () {
                  setState(() {
                    changeSuffixIcon = !changeSuffixIcon;

                    if (changeSuffixIcon == true)
                      suffixIcon = FontAwesomeIcons.eye;
                    else
                      suffixIcon = FontAwesomeIcons.eyeSlash;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

Widget textFormFieldLogin(
    {required BuildContext context,
    required String labelText,
    required TextInputType keyboardType,
    required IconData prefixIcon,
    IconData? suffixIcon,
    Function? suffixIconFuncion,
    required bool obscureTextPassword}) {
  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    color: Colors.transparent,
    margin: EdgeInsets.only(left: 20, right: 20),
    padding: EdgeInsets.all(5),
    child: TextFormField(
      obscureText: obscureTextPassword,
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
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: () {},
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
