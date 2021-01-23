import 'package:flutter/material.dart';
import 'package:my_first_app/styles/styles.dart';

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
          child: Column(children: [
        Center(
            child: Text(
          "Connections",
          style: CustomYellow,
        )),
        Expanded(
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, i) {
              return ListTile(
                  title: Text("Friend" + i.toString(), style: CustomYellow));
            },
          ),
        )
      ])),
    );
  }
}
