import 'package:flutter/material.dart';
// import 'package:my_first_app/search.dart';
// import 'profileSettings.dart';
// import 'main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  String usernameInsta = "yuvansundrani";
  String usernameSnap = "yuvan412";
  String usernameFacebook = 'yuvan.sundrani';
  String usernameLink = 'yuvan.sun';
  String usernameTwitter = 'yuvans_2_fr35h';

  List profileSocials = [
    "Instagram",
    "Snapchat",
    "Facebook",
    "LinkedIn",
    "Twitter"
  ];
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false; //Need to create individual switches for listview
  bool isSwitched4 = false; // builder, as a social is addded, a switch for that
  bool isSwitched5 = false; // social is also added ***

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {},
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

                  //**ListView Builder for chosen socials */
                  // Scaffold(
                  //   body: ListView.builder(
                  //       physics: BouncingScrollPhysics(),
                  //       itemCount: profileSocials.length,
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: EdgeInsets.all(8.0),
                  //           child: Card(
                  //               //color: Colors.grey[850],
                  //               margin: EdgeInsets.all(5),
                  //               elevation: 30,
                  //               child: Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Row(
                  //                   children: <Widget>[
                  //                     Image.asset(
                  //                       "assets/images/SMLogos/" +
                  //                           profileSocials[index] +
                  //                           "Logo.png",
                  //                       height: 70,
                  //                       width: 70,
                  //                     ),
                  //                     Flexible(
                  //                       child: TextField(
                  //                         style: TextStyle(
                  //                             color: Colors.yellow[200],
                  //                             fontSize: 20,
                  //                             letterSpacing: 2,
                  //                             fontWeight: FontWeight.bold),
                  //                         obscureText: false,
                  //                         decoration: InputDecoration(
                  //                           enabledBorder: OutlineInputBorder(
                  //                             borderSide: BorderSide(
                  //                               color: Colors.grey,
                  //                             ),
                  //                           ),
                  //                           focusedBorder: OutlineInputBorder(
                  //                             borderSide: BorderSide(
                  //                               color: Colors.yellow[200],
                  //                             ),
                  //                           ),
                  //                           prefixIcon: Icon(Icons.person,
                  //                               color: Colors.yellow[200]),
                  //                           hintText: "Username",
                  //                           filled: true,
                  //                           fillColor: Colors.grey[850],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               )),
                  //         );
                  //       }),
                  // ),

                  Card(
                    elevation: 20,
                    color: Colors.grey[850],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Switch(
                            value: isSwitched1,
                            onChanged: (value) {
                              setState(() {
                                isSwitched1 = value;
                                print(isSwitched1);
                              });
                            },
                            activeTrackColor: Colors.grey,
                            activeColor: Colors.yellowAccent,
                          ),
                          Image.asset('assets/images/SMLogos/InstagramLogo.png',
                              height: 60, width: 60),
                          SizedBox(width: 10),
                          Flexible(
                            child: TextField(
                              style: TextStyle(
                                color: Colors.yellow[200],
                                fontSize: 20,
                                //letterSpacing: 2,
                                //fontWeight: FontWeight.bold
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.yellow[200],
                                  ),
                                ),
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.white),
                                hintText: "Username",
                                filled: true,
                                fillColor: Colors.grey[850],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    elevation: 20,
                    color: Colors.grey[850],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Switch(
                            value: isSwitched2,
                            onChanged: (value) {
                              setState(() {
                                isSwitched2 = value;
                                print(isSwitched2);
                              });
                            },
                            activeTrackColor: Colors.grey,
                            activeColor: Colors.yellowAccent,
                          ),
                          Image.asset('assets/images/SMLogos/snap.png',
                              height: 60, width: 60),
                          SizedBox(width: 10),
                          Text(
                            '$usernameSnap',
                            style: TextStyle(
                              fontSize: 20,
                              //fontWeight: FontWeight.bold,
                              color: Colors.yellow[200],
                              letterSpacing: 2.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    elevation: 20,
                    color: Colors.grey[850],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Switch(
                            value: isSwitched3,
                            onChanged: (value) {
                              setState(() {
                                isSwitched3 = value;
                                print(isSwitched3);
                              });
                            },
                            activeTrackColor: Colors.grey,
                            activeColor: Colors.yellowAccent,
                          ),
                          Image.asset('assets/images/SMLogos/FacebookLogo.png',
                              height: 60, width: 60),
                          SizedBox(width: 10),
                          Text(
                            '$usernameFacebook',
                            style: TextStyle(
                              fontSize: 20,
                              //fontWeight: FontWeight.bold,
                              color: Colors.yellow[200],
                              letterSpacing: 2.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    elevation: 20,
                    color: Colors.grey[850],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Switch(
                            value: isSwitched4,
                            onChanged: (value) {
                              setState(() {
                                isSwitched4 = value;
                                print(isSwitched4);
                              });
                            },
                            activeTrackColor: Colors.grey,
                            activeColor: Colors.yellowAccent,
                          ),
                          Image.asset('assets/images/SMLogos/LinkedinLogo.png',
                              height: 60, width: 60),
                          SizedBox(width: 10),
                          Text(
                            '$usernameLink',
                            style: TextStyle(
                              fontSize: 20,
                              //fontWeight: FontWeight.bold,
                              color: Colors.yellow[200],
                              letterSpacing: 2.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    elevation: 20,
                    color: Colors.grey[850],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Switch(
                            value: isSwitched5,
                            onChanged: (value) {
                              setState(() {
                                isSwitched5 = value;
                                print(isSwitched5);
                              });
                            },
                            activeTrackColor: Colors.grey,
                            activeColor: Colors.yellowAccent,
                          ),
                          Image.asset('assets/images/SMLogos/TwitterLogo.png',
                              height: 60, width: 60),
                          SizedBox(width: 10),
                          Text(
                            '$usernameTwitter',
                            style: TextStyle(
                              fontSize: 20,
                              //fontWeight: FontWeight.bold,
                              color: Colors.yellow[200],
                              letterSpacing: 2.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 70, 30),
                    child: RaisedButton(
                      onPressed: () {},
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
                                  fontSize: 20,
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
