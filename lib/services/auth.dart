import 'package:coffee_break/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a customUser from a fireBase user
  User createUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  // auth change Stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(createUser);
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
   Future signInWithEmailAndPassword({String email, String password}) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return createUser(user);
    } catch (e) {
      return null;
    }
  }

  // Sign Up with email and password
  Future signUpWithEmailAndPassword({String email, String password}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return createUser(user);
    } catch (e) {
      return null;
    }
  }

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
