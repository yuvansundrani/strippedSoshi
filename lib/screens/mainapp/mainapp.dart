import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_first_app/screens/mainapp/profile.dart';
import 'package:my_first_app/screens/mainapp/qrCode.dart';
import 'friendScreen.dart';
import 'package:my_first_app/styles/styles.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Widget> screens = [QRScreen(), Profile(), FriendScreen()];

  // initialize screen to home screen
  int currScreen = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Soshi", style: CustomLight),
          backgroundColor: Colors.grey[700],
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[900],
        body: screens[currScreen],
        bottomNavigationBar: CurvedNavigationBar(
            index: currScreen,
            height: 60.0,
            color: Colors.grey[800],
            backgroundColor: Colors.grey[900],
            buttonBackgroundColor: Colors.black,
            animationDuration: Duration(milliseconds: 400),
            onTap: (index) {
              setState(() {
                currScreen = index;
              });
            },
            items: [
              Icon(Icons.qr_code, color: Colors.yellow[200]),
              Icon(Icons.person, color: Colors.yellow[200]),
              Icon(Icons.group, color: Colors.yellow[200]),
            ]),
      ),
    );
  }
}
