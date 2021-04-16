import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/services/database.dart';
import 'package:my_first_app/styles/styles.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Friend {
  String UID, fullName, username;

  Friend({String UID, String fullName, String username}) {
    this.UID = UID;
    this.fullName = fullName;
    this.username = username;
  }

  // getters
  String getUID() {
    return this.UID;
  }

  String getFullName() {
    return this.fullName;
  }

  String getUsername() {
    return this.username;
  }
}

class FriendScreen extends StatefulWidget {
  // pass in friends list, return map of UIDs to full names
  @override
  _FriendScreenState createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  Future<List<Friend>> generateFriendsList(
      DatabaseService databaseService) async {
    List<dynamic> friendsListUIDs;
    friendsListUIDs = await databaseService.getFriends();
    List<Friend> formattedFriendsList = new List<Friend>();
    // store full name of current user in list
    String fullName, username;
    for (String otherUID in friendsListUIDs) {
      fullName = await databaseService.getFullName(otherUID);
      username = await databaseService.getUsername(
          otherUID: otherUID, platform: "Soshi");
      formattedFriendsList.add(
          new Friend(UID: otherUID, fullName: fullName, username: username));
    }
    // return [
    //   new Friend(
    //       UID: "testUID", username: "testUsername", fullName: "testFullName")
    // ];
    return formattedFriendsList;
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  String getPlatformURL({String platform, String username}) {
    if (platform == "Instagram") {
      return "https://www.instagram.com/" + username + "/?hl=en";
    } else if (platform == "Snapchat") {
      return "https://www.snapchat.com/add/" + username;
    } else if (platform == "Twitter") {
      return "https://www.mobile.twitter.com/" + username;
    } else if (platform == "Linkedin") {
      // may need to look into linkedin links (weird and can have random numbers after username)
    } else if (platform == "Facebook") {
      return "https://www.facebook.com/" + username + "/";
    }
    // insta snapchat twitter linkedin facebook
  }

  Widget createSMButton({String platform, String username}) {
    return OutlinedButton(
      child: Image.asset(
        "assets/images/SMLogos/" + platform + "Logo.png",
      ),
      onPressed: () {
        _launchURL(getPlatformURL(platform: platform, username: username));
      },
    );
  }

  Widget createFriendTile(
      {BuildContext context, Friend friend, DatabaseService databaseService}) {
    return ListTile(
        onTap: () async {
          // get 'list of all visible platforms
          List<String> visiblePlatforms =
              await databaseService.getEnabledPlatformsList(friend.UID);
          Map<String, dynamic> usernames =
              await databaseService.getUserProfileNames(friend.UID);
          String fullName = await databaseService.getFullName(friend.UID);

          int index = 0;
          // TESTING
          showDialog(
              barrierColor: Colors.grey[500].withOpacity(.25),
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    content: Container(
                      height: 300.0,
                      width: 250.0,
                      child: Column(children: [
                        CircleAvatar(child: Icon(Icons.person), radius: 20.0),
                        Text("@" + usernames["Soshi"],
                            style: TextStyle(fontSize: 8.0)),
                        Divider(
                          color: Colors.blueGrey,
                          indent: 50.0,
                          endIndent: 50.0,
                        ),
                        Text(fullName,
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold)),
                        Divider(color: Colors.blueGrey),
                        Container(
                          height: 200.0,
                          width: 250.0,
                          padding: EdgeInsets.only(top: 10.0),
                          child: ListView.separated(
                            separatorBuilder: (BuildContext context, int i) {
                              return Padding(padding: EdgeInsets.all(10.0));
                            },
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                tileColor: Colors.transparent,
                                leading: createSMButton(
                                  platform: visiblePlatforms[index],
                                  username: usernames[visiblePlatforms[index]],
                                ),
                                trailing: createSMButton(
                                  platform: visiblePlatforms[++index],
                                  username:
                                      usernames[visiblePlatforms[index++]],
                                ),
                              );
                            },
                            // FOR TESTING

                            itemCount: visiblePlatforms.length - 2,
                          ),
                        ),
                      ]),
                    ));
              });
        },
        // actual code for friend tile (not popup)
        leading: Column(
          children: [
            CircleAvatar(child: Icon(Icons.person)),
            Padding(padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0)),
            Text("@" + friend.username,
                style: TextStyle(fontSize: 8.0, color: Colors.yellow[200]))
          ],
        ),
        title:
            Text(friend.fullName, style: TextStyle(color: Colors.yellow[200])),
        tileColor: Colors.grey[850],
        selectedTileColor: Colors.grey[800],
        contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(width: 1.0, color: Colors.yellow[200])),
        trailing: PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: ElevatedButton(
                    child: Text("Remove Friend"),
                    onPressed: () {
                      setState(() {
                        databaseService.removeFriend(friendUID: friend.UID);
                      });
                    }))
          ];
        }));
  }

  @override
  Widget build(BuildContext context) {
    List<Friend> friendsList;
    DatabaseService databaseService = new DatabaseService(
        UIDIn: Provider.of<User>(context, listen: false).uid);
    return FutureBuilder(
        future: generateFriendsList(databaseService),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // check if request is still loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading...");
            // check if request is empty
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Text("No connection!");
          }
          // check if request is done
          else if (snapshot.connectionState == ConnectionState.done) {
            friendsList = snapshot.data;

            if (friendsList.isEmpty) {
              return Text("You have no friends :(");
            }
            return ListView.separated(
                separatorBuilder: (BuildContext context, int i) {
                  return Padding(padding: EdgeInsets.all(5.0));
                },
                itemBuilder: (BuildContext context, int i) {
                  return createFriendTile(
                      context: context,
                      friend: friendsList[i],
                      databaseService: databaseService);
                },
                itemCount: (friendsList == null) ? 1 : friendsList.length,
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0));
          }
        });
  }
}
