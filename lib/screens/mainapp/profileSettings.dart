import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/services/auth.dart';
import 'package:my_first_app/services/database.dart';
import 'package:my_first_app/styles/styles.dart';
import 'package:provider/provider.dart';

class ProfileSettings extends StatefulWidget {
  @override
  ProfileSettingsState createState() => ProfileSettingsState();
}

class ProfileSettingsState extends State<ProfileSettings> {
  Widget build(BuildContext context) {
    return Container(
        child: FloatingActionButton(
            child: Icon(Icons.logout),
            onPressed: () {
              AuthService authService = new AuthService();
              authService.signOut();
            }),
        alignment: Alignment.center);
  }
}
