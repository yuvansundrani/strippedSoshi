import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DataBaseService {
  String UID;

  DataBaseService({String UIDIn}) {
    UID = UIDIn;
  }

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  /*
  Creates file for new user
  */
  Future createUserFile() async {
    return await usersCollection.doc(UID).set(<String, dynamic>{
      "Name": {"First": null, "Last": null},
      "Friends": <String>[],
      "Usernames": <String, String>{
        "Instagram": null,
        "Snapchat": null,
        "Linkedin": null
      },
      "Switches": <String, bool>{
        "Instagram": false,
        "Snapchat": false,
        "Linkedin": false
      }
    });
  }

  Future updateUsernameForPlatform({String platform, String username}) async {
    return await usersCollection.doc(UID).update({"$platform": username});
  }

  Future addFriend({String friendUID}) async {
    return await usersCollection.doc(UID).update({
      "Friends": [friendUID]
    });
  }

  Future removeFriend({String friendUID}) async {
    return await usersCollection.doc(UID);
  }

  Future updateSwitch({String platform, bool state}) async {
    return await usersCollection.doc(UID).update({"$platform": bool});
  }

  // return list of friends (for use with friend screen)
  dynamic getFriends() async {
    DocumentReference reference =
        FirebaseFirestore.instance.collection("users").doc(UID);
  }
}
