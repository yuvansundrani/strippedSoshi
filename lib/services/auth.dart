import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_first_app/services/database.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future signInWithEmailAndPassword({String emailIn, String passwordIn}) async {
    try {
      UserCredential loginResult = await _auth.signInWithEmailAndPassword(
          email: emailIn, password: passwordIn);
      User user = loginResult.user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  // sign in with email and password

  // sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    //   // Trigger the sign-in flow
    //   final LoginResult result = await FacebookAuth.instance.login();

    //   // Create a credential from the access token
    //   final facebookAuthCredential =
    //       FacebookAuthProvider.credential(result.accessToken.toString());

    //   // Once signed in, return the UserCredential
    //   return await FirebaseAuth.instance
    //       .signInWithCredential(facebookAuthCredential);
  }

  Future registerWithEmailAndPassword(
      {String emailIn, String passwordIn}) async {
    try {
      UserCredential registerResult = await _auth
          .createUserWithEmailAndPassword(email: emailIn, password: passwordIn);
      User user = registerResult.user;
      DatabaseService databaseService = DatabaseService(UIDIn: user.uid);
      await databaseService.createUserFile();
      // USE EMAIL FOR NOW -- HAVE USER CREATE USERNAME WHEN REGISTERING
      databaseService.updateUsernameForPlatform(
          platform: "Soshi", username: emailIn);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
