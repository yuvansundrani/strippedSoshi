import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/services/database.dart';
import 'package:provider/provider.dart';
// import 'package:my_first_app/search.dart';
// import 'profileSettings.dart';
// import 'main.dart';
import 'chooseSocials.dart';
import 'profileSettings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget createSMSwitchCard({String platformName, String UID}) {
    DatabaseService databaseService = new DatabaseService(UIDIn: UID);
    // used to figure out if the button has been loaded from the database
    bool hasLoaded = false;
    // used to store local state of switch
    bool isSwitched = true;
    return Card(
      elevation: 20,
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            hasLoaded
                ? Container(
                    child: Switch(
                    value: isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitched = value;
                        databaseService.updatePlatformSwitch(
                            platform: platformName, state: value);
                      });
                    },
                    activeTrackColor: Colors.grey,
                    activeColor: Colors.yellowAccent,
                  ))
                // only use FutureBuilder for first build, then switch to local state
                : FutureBuilder(
                    future: databaseService.getUserSwitches(UID),
                    builder: (BuildContext context,
                        AsyncSnapshot<Map<String, dynamic>> snapshot) {
                      Map<String, dynamic> userSwitches = snapshot.data;
                      // set switch to state of platform switch from database
                      isSwitched =
                          snapshot.hasData ? userSwitches[platformName] : false;
                      return Switch(
                        value: isSwitched,
                        onChanged: (bool value) {
                          setState(() {
                            isSwitched = value;
                            hasLoaded = true;
                            databaseService.updatePlatformSwitch(
                                platform: platformName, state: value);
                          });
                        },
                        activeTrackColor: Colors.grey,
                        activeColor: Colors.yellowAccent,
                      );
                    }), //REGULAR WIDGET

            Image.asset('assets/images/SMLogos/' + platformName + 'Logo.png',
                height: 60, width: 60),
            SizedBox(width: 10),
            FutureBuilder(
                future: databaseService.getUserProfileNames(UID),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  String platformUsername;
                  if (snapshot.hasData) {
                    platformUsername = snapshot.data[platformName];
                  }
                  return Text(
                    platformUsername != null ? platformUsername : "Loading...",
                    style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                      color: Colors.yellow[200],
                      letterSpacing: 2.0,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String UID = Provider.of<User>(context, listen: false).uid;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      // floatingActionButton: FloatingActionButton(
      //   splashColor: Colors.grey,
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.exit_to_app,
      //     color: Colors.black,
      //   ),
      //   backgroundColor: Colors.yellow[500],
      // ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/05/Image-Files-Blog-Vector.jpg'),
                      radius: 50,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              // HORRIBLE STYLE, REDO THIS
                              return Scaffold(body: ProfileSettings());
                            }));
                          },
                          color: Colors.grey[850],
                          child: Row(
                            children: <Widget>[
                              Text("Edit Profile",
                                  style: TextStyle(
                                    color: Colors.yellow[200],
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ))
                            ],
                          )),
                    ],
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '  Toggle',
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  createSMSwitchCard(platformName: "Instagram", UID: UID),
                  SizedBox(height: 30),
                  createSMSwitchCard(platformName: "Snapchat", UID: UID),
                  SizedBox(height: 30),
                  createSMSwitchCard(platformName: "Facebook", UID: UID),
                  SizedBox(height: 30),
                  createSMSwitchCard(platformName: "Twitter", UID: UID),
                  SizedBox(height: 30),
                  createSMSwitchCard(platformName: "Linkedin", UID: UID),
                  // TextField(
                  //   style: TextStyle(
                  //     color: Colors.yellow,
                  //   ),
                  // ),
                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 70, 30),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          // HORRIBLE STYLE, REDO THIS
                          return Scaffold(body: ChooseSocials());
                        }));
                      },
                      color: Colors.grey[850],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              color: Colors.yellow[200],
                              size: 30,
                            ),
                          ),
                          Text('Add Social',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.yellow[200],
                                  letterSpacing: 3.0,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  )
                ])),
      ),
    );
  }
}
