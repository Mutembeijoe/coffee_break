import 'package:coffee_break/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a customUser from a fireBase user

  User createUser(FirebaseUser user){
    return user != null ? User(uid:user.uid): null;
  }
  // sign In Anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return createUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign In with email and password

  // Sign Up with email and password

  //sign out
}
