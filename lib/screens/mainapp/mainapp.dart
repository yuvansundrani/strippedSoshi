import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_first_app/screens/mainapp/profileSettings.dart';
import 'package:my_first_app/screens/mainapp/qrCode.dart';
import 'friendScreen.dart';
import 'package:my_first_app/styles/styles.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Widget> screens = [QRScreen(), MyProfileScreen(), FriendScreen()];

  // initialize screen to home screen
  int currScreen = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soshi", style: CustomLight),
        backgroundColor: Colors.grey[500],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: screens[currScreen],
      bottomNavigationBar: CurvedNavigationBar(
          index: currScreen,
          height: 60.0,
          color: Colors.grey[500],
          backgroundColor: Colors.grey[100],
          buttonBackgroundColor: Colors.black,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              currScreen = index;
            });
          },
          items: [
            Icon(Icons.qr_code, color: Colors.tealAccent),
            Icon(Icons.person, color: Colors.tealAccent),
            Icon(Icons.group, color: Colors.tealAccent),
          ]),
    );
  }
}
