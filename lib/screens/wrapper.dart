import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/loginscreen.dart';
import 'mainapp/mainapp.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // final user = null;
    if (user == null) {
      return LoginScreen();
    } else {
      return MainApp();
    }
  }
}
