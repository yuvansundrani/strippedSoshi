import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_first_app/friendScreen.dart';
import 'package:my_first_app/profile.dart';
import 'package:my_first_app/profileSettings.dart';

import 'profile.dart';
import 'chooseSocials.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> screens = [MyProfileScreen(), Profile(), FriendScreen()];
  //Change back to [QRScreen(), Profile(), FriendScreen()]

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
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Text(
              'Soshi',
              style: TextStyle(
                  color: Colors.yellow[200],
                  fontSize: 25,
                  letterSpacing: 2,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            elevation: 0, // Gets rid of the drop shadow on adroid devices
          ),
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
                Icon(
                  Icons.qr_code,
                  color: Colors.yellow[500],
                  size: 35,
                ),
                Icon(Icons.person, color: Colors.yellow[500], size: 35),
                Icon(Icons.group, color: Colors.yellow[500], size: 35),
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
