import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:my_first_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:material_dialogs/material_dialogs.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  // stores the scanned string | must do something with string for functionality
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<String> scanQR() async {
    String barcodeScanResult;

    barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.QR);
    print(barcodeScanResult);

    if (!mounted) return "";

    setState(() {
      _scanBarcode = barcodeScanResult;
    });
    return barcodeScanResult;
  }

  // return a popup dialog with user information
  Future<dynamic> _displayUser({BuildContext context, otherUID}) async {
    String addedUserRealName;
    String addedUsername;
    DatabaseService databaseService = new DatabaseService(
        UIDIn: Provider.of<User>(context, listen: false).uid);

    addedUserRealName = await databaseService.getFullName(otherUID);
    addedUsername = await databaseService.getUsername(
        otherUID: otherUID, platform: "Soshi");
    bool isFriendAdded = await databaseService.isFriendAdded(otherUID);
    return Dialogs.materialDialog(
        color: Colors.white,
        msg: '@' + addedUsername,
        title: addedUserRealName,
        animation: 'assets/animations/addFriendAnimation.json',
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              isFriendAdded
                  ?
                  // show friend profile popup
                  print("Showing friend profile...")
                  : setState(() {
                      isFriendAdded = true;
                      databaseService.addFriend(friendUID: otherUID);
                    });
            },
            text: isFriendAdded ? 'View Profile' : 'Connect',
            iconData: isFriendAdded ? Icons.person : Icons.add,
            color: isFriendAdded ? Colors.red : Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          )
        ]);
  }

  // return a popup dialog with user information
  Future<dynamic> _displayUserNotFound({BuildContext context}) {
    return Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Please try again',
        title: 'User not found',
        // animation: 'assets/animations/addFriendAnimation.json',
        context: context,
        actions: [
          IconsButton(
            onPressed: () {},
            text: 'OK',
            iconData: Icons.cancel,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              data: Provider.of<User>(context).uid,
              size: 400.0,
              padding: EdgeInsets.all(50.0),
              foregroundColor: Colors.yellow[200],
            ),
            RaisedButton(
              child: Text("Scan QR Code"),
              onPressed: () async {
                String QRScanResult = await scanQR();
                if (QRScanResult.length > 5) {
                  try {
                    _displayUser(context: context, otherUID: QRScanResult);
                  } catch (e) {
                    _displayUserNotFound(context: context);
                  }
                }
              },
              splashColor: Colors.yellow[500],
            )
          ]),
    ));
  }
}
