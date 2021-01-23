import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:my_first_app/screens/wrapper.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
        ),
        home: Wrapper());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
      //routes: {
      //'/profileSettings': (context) => ProfileSettings(),
      //}
      ));
}
