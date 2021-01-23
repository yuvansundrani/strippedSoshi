import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class DataBaseService {
  String UID;

  DataBaseService({String UIDIn}) {
    UID = UIDIn;
  }

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  Future updateUserData({String username}) async {
    return await usersCollection.doc(UID).update({"Username": username});
  }
}
