import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonymously (REMOVE AND DISABLE ON DEPLOY)
  Future signInAnon() async {
    try {
      UserCredential loginResult = await _auth.signInAnonymously();
      User user = loginResult.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithUsernameAndPassword(
      {String emailIn, String passwordIn}) async {
    try {
      UserCredential loginResult = await _auth.signInWithEmailAndPassword(
          email: emailIn, password: passwordIn);
      User user = loginResult.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
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
}
