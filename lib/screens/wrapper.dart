import 'package:flutter/material.dart';
import 'login/loginscreen.dart';
import 'mainapp/mainapp.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    // return login screen or main app
    return LoginScreen();
  }
}
