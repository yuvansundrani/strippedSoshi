import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_first_app/screens/profileSettings.dart';

import 'screens/friendScreen.dart';
import 'screens/qrCode.dart';
import 'screens/profileSettings.dart';
import 'package:my_first_app/styles/textStyles.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> screens = [QRScreen(), MyProfileScreen(), FriendScreen()];

  // initialize screen to home screen
  int currScreen = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("Soshi", style: customYellow)),
          backgroundColor: Colors.grey[900],
          body: screens[currScreen],
          bottomNavigationBar: CurvedNavigationBar(
              index: currScreen,
              height: 60.0,
              color: Colors.grey[850],
              backgroundColor: Colors.grey[900],
              buttonBackgroundColor: Colors.black,
              animationDuration: Duration(milliseconds: 400),
              onTap: (index) {
                setState(() {
                  currScreen = index;
                });
              },
              items: [
                Icon(Icons.qr_code, color: Colors.yellow[500]),
                Icon(Icons.person, color: Colors.yellow[500]),
                Icon(Icons.group, color: Colors.yellow[500]),
              ]),
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          // ),
          drawer: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ));
  }
}

void main() {
  runApp(MyApp(
      //routes: {
      //'/profileSettings': (context) => ProfileSettings(),
      //}
      ));
}
