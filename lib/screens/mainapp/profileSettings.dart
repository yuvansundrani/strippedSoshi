import 'package:flutter/material.dart';
import 'package:my_first_app/styles/styles.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> {
  @override
  int connectionCount = 0;

  String username = "yuvan412";
  String password = "********";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2020/05/Image-Files-Blog-Vector.jpg'),
                radius: 50,
              ),
            ),
            RaisedButton(
              color: Colors.grey[850],
              onPressed: () {},
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit Profile Picture',
                      style: CustomLight,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.mode_edit,
                      size: 15,
                      color: Colors.tealAccent,
                    )
                  ],
                ),
              ),
            ),

            Divider(height: 40, color: Colors.blueGrey),
            Row(
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(width: 120),
                RaisedButton(
                    color: Colors.grey[850],
                    onPressed: () {
                      //Navigator.pushNamed(context, '/profileSettings');
                    },
                    child: Row(
                      children: [
                        Text(
                          'Edit Profile',
                          style: CustomLight,
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.mode_edit,
                            color: Colors.tealAccent, size: 15)
                      ],
                    )),
              ],
            ),
            Row(
              children: [
                Text(
                  'Yuvan Sundrani',
                  style: CustomLight,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('$username', style: CustomLight),
            SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$password',
              style: CustomLight,
            ),
            SizedBox(height: 10),
            Icon(Icons.email_outlined, color: Colors.grey, size: 25),
            SizedBox(height: 10),
            Text('yuvan.sundrani@gmail.com', style: CustomLight),
            SizedBox(height: 20),
            Icon(
              Icons.emoji_people, // or Icons.poeple_round
              color: Colors.grey,
              size: 25,
            ),
            SizedBox(height: 0),
            //Row with add button on the right of it
            Row(
              children: <Widget>[
                Text('$connectionCount' + ' connections', style: CustomLight),
                SizedBox(width: 10),
                FloatingActionButton(
                  splashColor: Colors.grey,
                  //Alignment.bottomRight,
                  mini: true,
                  //Push all the way to right!!!!
                  onPressed: () {
                    setState(() {
                      connectionCount += 1;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.tealAccent,
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
