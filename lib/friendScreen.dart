import 'package:flutter/material.dart';

class FriendScreen extends StatefulWidget {
  @override
  FriendScreenState createState() => FriendScreenState();
}

class FriendScreenState extends State<FriendScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(10),
      child: Container(
          child: Center(
        child: ButtonBar(alignment: MainAxisAlignment.center, children: [
          RaisedButton(child: Text("Connections"), onPressed: () {}),
        ]),
      )),
    );
  }
}
