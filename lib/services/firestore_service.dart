import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debt_tracker/models/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');

  Future createUser(User user) async {
    try {
      await _usersCollectionReference
          .document(user.userId)
          .setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromJson(userData.data);
    } catch (e) {
      return e.message;
    }
  }
}
