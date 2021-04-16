import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String UID;

  DatabaseService({String UIDIn}) {
    UID = UIDIn;
  }

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  /*
  Creates file for new user
  */
  Future createUserFile() async {
    return await usersCollection.doc(UID).set(<String, dynamic>{
      "Name": {"First": null, "Last": null},
      "Friends": <String>[],
      "Usernames": <String, String>{
        "Soshi": null,
        "Instagram": null,
        "Snapchat": null,
        "Linkedin": null,
        "Twitter": null,
        "Facebook": null,
      },
      "Switches": <String, bool>{
        "Instagram": false,
        "Snapchat": false,
        "Linkedin": false,
        "Twitter": false,
        "Facebook": false,
      }
    });
  }

  /*
  Methods pertaining to updating user data
  */
  // see following reference: https://pub.dev/packages/cloud_firestore/example
  Future<void> updateUsernameForPlatform(
      {String platform, String username}) async {
    // get current map of usernames
    Map<String, dynamic> usernamesMap = await getUserProfileNames(UID);
    // update local map to reflect change
    usernamesMap[platform] = username;
    // update database to reflect local map change
    return await usersCollection.doc(UID).update({"Usernames": usernamesMap});
  }

  Future<void> updatePlatformSwitch({String platform, bool state}) async {
    Map<String, dynamic> switches;
    await usersCollection
        .doc(UID)
        .get()
        .then((DocumentSnapshot ds) => switches = ds.data()["Switches"]);
    // update map locally
    switches["$platform"] = state;
    // upload change to database
    return await usersCollection.doc(UID).update({"Switches": switches});
  }

  // updates single field in database
  // returns true if successful, false otherwise
  // ** NOT FOR USE WITH MAP/LIST entries (friendsList, usernames, etc.)
  Future<void> updateField(String key, dynamic value) async {
    try {
      await usersCollection.doc(UID).update({"$key": value});
      return true;
    } catch (e) {
      return false;
    }
  }

  /*
  Methods pertaining to friends list
  */

  Future addFriend({String friendUID}) async {
    // get copy of current friends list
    List<dynamic> friendsList = await getFriends();

    // check to see if list already exists
    if (friendsList == null) {
      // create new list
      friendsList = [friendUID];
    } else {
      // add new friend to list
      friendsList.add(friendUID);
    }

    return await usersCollection.doc(UID).update({"Friends": friendsList});
  }

  Future<void> removeFriend({String friendUID}) async {
    List<dynamic> friendsList;
    // get current friends list from database
    friendsList = await getFriends();
    // remove friend from local list
    friendsList.remove(friendUID);
    // update database to reflect change
    await usersCollection.doc(UID).update({"Friends": friendsList});
  }

  // return list of friends (for use with friend screen)
  Future<List<dynamic>> getFriends() async {
    List<dynamic> friendsList;
    await usersCollection
        .doc(UID)
        .get()
        .then((DocumentSnapshot ds) => friendsList = ds.data()["Friends"]);
    return friendsList;
  }

  // check if friend is added
  Future<bool> isFriendAdded(String otherUID) async {
    List<dynamic> friendsList = await getFriends();
    return friendsList.contains(otherUID);
  }

  /*
  Methods pertaining to getting user data
  */

  // pass in UID, return map of user switches (platform visibility)
  Future<Map<String, dynamic>> getUserSwitches(String otherUID) async {
    Map<String, dynamic> switchMap;
    await usersCollection
        .doc(otherUID)
        .get()
        .then((DocumentSnapshot ds) => switchMap = ds.data()["Switches"]);
    return switchMap;
  }

  // get list of enabled user switches
  Future<List<String>> getEnabledPlatformsList(String otherUID) async {
    Map<String, dynamic> platformsMap = await getUserSwitches(otherUID);

    List<String> enabledPlatformsList = [];
    // add all enabled platforms to platformsList
    platformsMap.forEach((platform, state) {
      if (state == true) {
        enabledPlatformsList.add(platform);
      }
    });
    return enabledPlatformsList;
  }

  // pass in UID, return map of user profile names
  Future<Map<String, dynamic>> getUserProfileNames(String otherUID) async {
    Map<String, dynamic> profileNamesMap;
    await usersCollection.doc(otherUID).get().then(
        (DocumentSnapshot ds) => profileNamesMap = ds.data()["Usernames"]);
    return profileNamesMap;
  }

  // return username for specified platform
  Future<String> getUsername({String otherUID, String platform}) async {
    String username;
    Map<String, dynamic> profileNamesMap = await getUserProfileNames(otherUID);
    username = profileNamesMap[platform];
    return username;
  }

  // pass in UID, return map of full name of user
  Future<Map<String, dynamic>> getFullNameMap(String otherUID) async {
    Map<String, dynamic> fullNameMap;
    await usersCollection
        .doc(otherUID)
        .get()
        .then((DocumentSnapshot ds) => fullNameMap = ds.data()["Name"]);
    return fullNameMap;
  }

  // pass in UID, return map of full name of user
  Future<String> getFullName(String otherUID) async {
    Map<String, dynamic> fullNameMap;
    String fullName;
    fullNameMap = await getFullNameMap(otherUID);
    // convert to String
    fullName = fullNameMap["First"] + " " + fullNameMap["Last"];
    return fullName;
  }
}
