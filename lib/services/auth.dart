import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_first_app/services/database.dart';

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
  Future signInWithGoogle() async {
    //   try {
    //     UserCredential loginResult = await _auth
    //   } catch (e) {
    //     print(e.toString());
    //     return null;
    //   }
  }

  Future signInWithFacebook() async {}

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
