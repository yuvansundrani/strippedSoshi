import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/services/database.dart';
import 'package:provider/provider.dart';
// import 'package:my_first_app/search.dart';
// import 'profileSettings.dart';
// import 'main.dart';
import 'chooseSocials.dart';
import 'profileSettings.dart';

class SMCard extends StatefulWidget {
  String platformName, UID;
  SMCard({String platformName, String UID}) {
    this.platformName = platformName;
    this.UID = UID;
  }
  @override
  _SMCardState createState() => _SMCardState();
}

class _SMCardState extends State<SMCard> {
  Future<Map<String, dynamic>> switchesFutureMap;
  DatabaseService databaseService;
  String UID, platformName;
// used to figure out if the button has been loaded from the database
  bool hasLoaded = false;
  // used to store local state of switch
  bool isSwitched = false;
  @override
  void initState() {
    super.initState();
    UID = widget.UID;
    platformName = widget.platformName;
    databaseService = new DatabaseService(UIDIn: UID);
    switchesFutureMap = databaseService.getUserSwitches(UID);
  }

  @override
  Widget build(BuildContext context) {
    // text controller for username box
    TextEditingController usernameController = new TextEditingController();
    return Card(
      elevation: 20,
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            FutureBuilder(
                future: switchesFutureMap,
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.hasData && hasLoaded == false) {
                    isSwitched = snapshot.data[platformName];
                  }
                  print(hasLoaded);
                  return Switch(
                      value: isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched = value;
                        });
                        hasLoaded = true;
                        print(hasLoaded);
                        databaseService.updatePlatformSwitch(
                            platform: platformName, state: value);
                      });
                }),
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
                    usernameController.text = platformUsername;
                  }
                  return Expanded(
                    child: TextField(
                      controller: usernameController,
                      // onTap: () => usernameController.text = platformUsername,
                      onSubmitted: (String text) {
                        databaseService.updateUsernameForPlatform(
                            platform: platformName, username: text);
                        usernameController.text = text;
                      },
                      decoration: InputDecoration(
                        hintText: usernameController.text == ""
                            ? platformUsername
                            : usernameController.text,
                        hintStyle: TextStyle(
                          fontSize: 20,
                          //fontWeight: FontWeight.bold,
                          color: Colors.yellow[200],
                          letterSpacing: 2.0,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        color: Colors.yellow[200],
                        letterSpacing: 2.0,
                      ),
                    ),
                  );
                }),
            Icon(Icons.edit, color: Colors.yellow[200])
          ],
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  SMCard(platformName: "Instagram", UID: UID),
                  SizedBox(height: 30),
                  SMCard(platformName: "Snapchat", UID: UID),
                  SizedBox(height: 30),
                  SMCard(platformName: "Facebook", UID: UID),
                  SizedBox(height: 30),
                  SMCard(platformName: "Twitter", UID: UID),
                  SizedBox(height: 30),
                  SMCard(platformName: "Linkedin", UID: UID),
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
