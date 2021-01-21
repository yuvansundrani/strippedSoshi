import 'package:flutter/material.dart';

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
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.yellow[200],
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.mode_edit,
                      size: 15,
                      color: Colors.yellow[200],
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
                SizedBox(width: 146),
                RaisedButton(
                    color: Colors.grey[850],
                    onPressed: () {
                      //Navigator.pushNamed(context, '/profileSettings');
                    },
                    child: Row(
                      children: [
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.yellow[200],
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.mode_edit,
                            color: Colors.yellow[200], size: 15)
                      ],
                    )),
              ],
            ),
            Row(
              children: [
                Text(
                  'Yuvan Sundrani',
                  style: TextStyle(
                    color: Colors.yellow[200],
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
            Text(
              '$username',
              style: TextStyle(
                color: Colors.yellow[200],
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
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
              style: TextStyle(
                  color: Colors.yellow[200],
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Icon(Icons.email_outlined, color: Colors.grey, size: 25),
            SizedBox(height: 10),
            Text(
              'yuvan.sundrani@gmail.com',
              style: TextStyle(
                color: Colors.yellow[200],
                letterSpacing: 2.0,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                Text(
                  '$connectionCount' + ' connections',
                  style: TextStyle(
                    color: Colors.yellow[200],
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                  backgroundColor: Colors.yellow[500],
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
