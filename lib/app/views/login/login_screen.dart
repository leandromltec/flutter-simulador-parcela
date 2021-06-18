import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                obscureTextPassword: false),
            textFormFieldLogin(
                context: context,
                labelText: "Digite sua senha",
                obscureTextPassword: true),
          ],
        ),
      ),
    );
  }
}

Widget textFormFieldLogin(
    {required BuildContext context,
    required String labelText,
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
          fillColor: Color(0XFF35ced4),
          filled: true,
          contentPadding: EdgeInsets.all(20),
          hintStyle: TextStyle(color: Colors.white),
          errorStyle: TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          labelStyle: TextStyle(color: Colors.white),
          labelText: labelText),
    ),
  );
}
