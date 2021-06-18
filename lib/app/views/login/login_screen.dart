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
                keyboardType: TextInputType.emailAddress,
                obscureTextPassword: false,
                prefixIcon: Icons.account_circle_rounded),
            textFormFieldLogin(
                context: context,
                labelText: "Digite sua senha",
                keyboardType: TextInputType.text,
                obscureTextPassword: true,
                prefixIcon: Icons.account_circle_rounded),
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
          prefixIcon: Icon(
            prefixIcon,
            size: 50,
            color: Colors.white,
          ),
          suffixIcon: Icon(suffixIcon),
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
