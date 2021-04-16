import 'package:flutter/material.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //     child: TextField(
        //   obscureText: true,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: "Password",
        //   ),
        // )

        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.qr_code, size: 150.0, color: Colors.yellow[600]),
            RaisedButton(
              child: Text("Scan QR Code"),
              onPressed: () {},
              splashColor: Colors.yellow[500],
            )
          ]),
    ));
  }
}
