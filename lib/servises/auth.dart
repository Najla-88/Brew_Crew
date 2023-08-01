import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create user obj based on FirebaseUser
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

// auth change user stream
  Stream<AppUser?> get user {
    return _auth
        .authStateChanges()
        // .map((User? user) => _userFromFirebaseUser(user!));
        .map(_userFromFirebaseUser);
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
