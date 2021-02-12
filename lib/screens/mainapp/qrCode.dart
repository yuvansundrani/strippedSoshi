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
  Future<dynamic> _displayUser({BuildContext context, otherUID}) {
    return Dialogs.materialDialog(
        color: Colors.white,
        msg: 'UID $otherUID',
        title: 'User Found!',
        animation: 'assets/animations/addFriendAnimation.json',
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              try {
                DataBaseService dataBaseService = new DataBaseService(
                    UIDIn: Provider.of<User>(context, listen: false).uid);
                dataBaseService.addFriend(friendUID: otherUID);
              } catch (e) {
                print(e);
              }
            },
            text: 'Add',
            iconData: Icons.add,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
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
              foregroundColor: Colors.tealAccent,
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

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new Column(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new Column(children: [(document.data()['Usernames'])]);
          }).toList(),
        );
      },
    );
  }
}
