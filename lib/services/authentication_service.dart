import 'package:debt_tracker/app/locator.dart';
import 'package:debt_tracker/models/user.dart';
import 'package:debt_tracker/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginAnonymously() async {
    try {
      var authResult = await _firebaseAuth.signInAnonymously();

      await _populateCurrentUser(authResult.user);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authRequest = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      await _populateCurrentUser(authRequest.user);

      return authRequest.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null)
      try {
        var userResult = await _firestoreService.getUser(user.uid);
        if (userResult is User)
          _currentUser = userResult;
        else if (userResult is bool && !userResult) {
          _currentUser = User(
            userId: user.uid,
            email: user.email,
            fullName: user.displayName,
          );

          await _firestoreService.createUser(_currentUser);
        } else
          throw Exception('There was a problem retrieving the user data.');
      } catch (e) {
        return e.message;
      }
  }
}
