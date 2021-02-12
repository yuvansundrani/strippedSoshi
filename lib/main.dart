import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/auth.dart';
import 'package:my_first_app/screens/wrapper.dart';
import 'styles/styles.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(theme: CustomTheme, home: Wrapper()));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // testing
  // print(
  //     new DataBaseService(UIDIn: "RuPDkynjZxbVezUgP6KyVj2b1tu1").getFriends());
  // end testing
  runApp(MyApp());
}
