import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              data: "Soshi",
              size: 400.0,
              padding: EdgeInsets.all(50.0),
              foregroundColor: Colors.yellow,
            ),
            RaisedButton(
              child: Text("Scan QR Code"),
              onPressed: () {},
              splashColor: Colors.yellow[500],
            )
          ]),
    ));
  }
}
