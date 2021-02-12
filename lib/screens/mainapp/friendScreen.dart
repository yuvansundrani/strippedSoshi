import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/styles/styles.dart';
import 'package:provider/provider.dart';

class FriendScreen extends StatelessWidget {
  Future<List<String>> getFriends(String uid) async {
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    try {
      return ds.data()['Friends'];
    } catch (e) {
      print(e);
      return ["No friends found."];
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // try {
    //   return Text("null");
    // } finally {
    //   s.then((message) {
    //     return Text("Friends " + message[0]);
    //   });
    // }
    return StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          // get future of friends list
          Future<List<String>> friendsListFuture =
              getFriends(Provider.of<User>(context, listen: false).uid);
          // store friends list in normal list
          List<String> friendsList;
          friendsListFuture.then((friends) {
            print("TESTING FRIENDS: " + friends.toString());
            friendsList = friends;
            print("TESTING FRIENDSLIST: " + friendsList.toString());
          });
          if (friendsList != null) {
            return ListView.builder(
                // itemCount: friendsList.length,
                itemBuilder: (context, i) {
              print(i);
              if (i < friendsList.length) {
                return ListTile(
                    title: Text("friendsList[i]"), tileColor: Colors.teal);
              }
            });
          } else {
            return Text("You have no friends :(");
          }
        });
  }

  List<dynamic> getFriendsListString(BuildContext context) {
    // get future of friends list
    Future<List<String>> friendsListFuture =
        getFriends(Provider.of<User>(context, listen: false).uid);
    // store friends list in normal list
    List<String> friendsList;
    friendsListFuture.then((friends) {
      print("TESTING FRIENDS: " + friends.toString());
      friendsList = friends;
      print("TESTING FRIENDSLIST: " + friendsList.toString());
      return friendsList;
    });
  }
}
