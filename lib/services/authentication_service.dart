import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/enums/roles.dart';
import 'firestore_service.dart';
import 'package:roam_free/models/user.dart';

class AuthenticationService {
  final Logger _logger = Logger();
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
    @required RolesType role,
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
            roleString: User.roleEnumToString(role)),
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      _logger.i("No user logged in");
    } else {
      _logger.i("${user.uid} is signed in");
    }
    return user != null;
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
    _logger.i("User Signed Out");
  }

  Future _populateCurrentUser(auth.User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  Future updateCurrentUser() async {
    final auth.User user = _firebaseAuth.currentUser;
    _populateCurrentUser(user);
    _logger.d("Updating current user on disk");
  }
}
