import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:roam_free/app/locator.dart';
import 'firestore_service.dart';
import 'package:roam_free/models/user.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _firestoreService.createUser(
        User(
          id: authResult.user.uid,
          email: email,
          firstName: firstName,
          lastName: lastName,
        ),
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final user = await _firebaseAuth.currentUser;

    return user != null;
  }

  Future signOut() async {
    _firebaseAuth.signOut();
  }

  Future _populateCurrentUser(auth.User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  Future updateCurrentUser() async {
    final auth.User user = _firebaseAuth.currentUser;
    _populateCurrentUser(user);
  }
}
