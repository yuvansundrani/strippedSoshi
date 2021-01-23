import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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

  void displayUser({String UID}) {
    // display a snackbar to show user data
    final snackBar = SnackBar(content: Text('$UID'));
    Scaffold.of(context).showSnackBar(snackBar);
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
              data: Provider.of<User>(context).uid.toString(),
              size: 400.0,
              padding: EdgeInsets.all(50.0),
              foregroundColor: Colors.yellow,
            ),
            RaisedButton(
              child: Text("Scan QR Code"),
              onPressed: () async {
                String QRScanResult = await scanQR();
                try {
                  displayUser(UID: QRScanResult);
                } catch (e) {
                  print("User not found. Please try again.");
                }
              },
              splashColor: Colors.yellow[500],
            )
          ]),
    ));
  }
}
