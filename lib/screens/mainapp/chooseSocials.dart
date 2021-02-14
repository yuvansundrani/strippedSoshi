import 'package:flutter/material.dart';

class ChooseSocials extends StatefulWidget {
  @override
  _ChooseSocialsState createState() => _ChooseSocialsState();
}

class _ChooseSocialsState extends State<ChooseSocials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //backgroundColor: ,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: <Widget>[
              Card(
                color: Colors.grey[850],
                elevation: 30,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/SMLogos/TiktokLogo.png',
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(width: 40),
                    Image.asset('assets/images/SMLogos/TiktokWriting.png',
                        height: 150, width: 150),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
