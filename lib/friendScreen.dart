import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FriendScreen extends StatefulWidget {
  @override
  FriendScreenState createState() => FriendScreenState();
}

class FriendScreenState extends State<FriendScreen> {
  List friendsDisplayNames = [
    "Mr. Ekat",
    "Jeet Shah",
    "Min Ding",
    "PoplCEO",
    "Jason Steinburg",
    "Sid Fagtap",
    "Yuvan Sundrani",
    "Kobe Bryant",
    "Mrs. Becker"
  ];

  List friendsUsernames = [
    "mysterykat",
    "skinsalltheway",
    "mindingNIST",
    "poplSux",
    "j.steinburg69",
    "sidFagtap420",
    "spideruv",
    "BlackMamba24",
    "retardedTeacher"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: friendsDisplayNames.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  color: Colors.grey[600],
                  elevation: 30,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                size: 60,
                                color: Colors.yellow[200],
                              ),
                            ]),
                        SizedBox(width: 20),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  friendsDisplayNames[index],
                                  style: TextStyle(
                                      //color: Colors.grey[200],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  "@" + friendsUsernames[index],
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),

                    // Column(children: <Widget>[
                    //   Container(
                    //     alignment: Alignment.bottomLeft,
                    //     child: Icon(
                    //       Icons.circle,
                    //       size: 60,
                    //     ),
                    //   ),
                    //   Column(
                    //     children: <Widget>[
                    //       Text("GG"),
                    //     ],
                    //   ),
                    // ]),
                  ),
                ),
              );
            }));

    //listview builder
    //use username under profile pic (empty icons for now)
    //Use diplay name on side
    //2 Different lists (BE CAREFUL)
  }
}
