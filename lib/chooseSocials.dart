import 'package:flutter/material.dart';

class ChooseSocials extends StatefulWidget {
  @override
  _ChooseSocialsState createState() => _ChooseSocialsState();
}

class _ChooseSocialsState extends State<ChooseSocials> {
  List chooseSocialsList = [
    "Instagram",
    "Snapchat",
    "Tiktok",
    "Facebook",
    "Twitter",
    "Linkedin",
    "Reddit",
    "Discord",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[900],
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: Colors.yellowAccent,
        //   splashColor: Colors.black,
        // ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: chooseSocialsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                    //color: Colors.grey[850],
                    margin: EdgeInsets.all(5),
                    elevation: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/SMLogos/" +
                                chooseSocialsList[index] +
                                "Logo.png",
                            height: 70,
                            width: 70,
                          ),
                          Text(chooseSocialsList[index]),
                        ],
                      ),
                    )),
              );
            }));
  }
}
