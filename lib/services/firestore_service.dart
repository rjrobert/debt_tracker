import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:debt_tracker/models/account.dart';
import 'package:debt_tracker/models/accountTransaction.dart';
import 'package:debt_tracker/models/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _accountsCollectionReference =
      Firestore.instance.collection('accounts');
  final CollectionReference _transactionsCollectionReference =
      Firestore.instance.collection('accountTransactions');

  final StreamController<List<Account>> _accountController =
      StreamController<List<Account>>.broadcast();
  final StreamController<List<AccountTransaction>> _transactionController =
      StreamController<List<AccountTransaction>>.broadcast();
  Stream<List<Account>> get accounts => _accountController.stream;
  Stream<List<AccountTransaction>> get accountTransactions =>
      _transactionController.stream;

  Future createUser(User user) async {
    try {
      await _usersCollectionReference
          .document(user.userId)
          .setData(user.toJson());

      await listenToAccounts(user.userId);
      await listenToTransactions(user.userId);
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      if (userData == null) return false;

      var user = User.fromJson(userData.data);

      await listenToAccounts(user.userId);
      await listenToTransactions(user.userId);

      return user;
    } catch (e) {
      return false;
    }
  }

  Future listenToAccounts(String userId) async {
    _accountsCollectionReference
        .where('userId', isEqualTo: userId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var newEntries = snapshot.documents
            .map((doc) => Account.fromJson(doc.data))
            .toList();

        _accountController.add(newEntries);
      }
    });
  }

  Future listenToTransactions(String userId) async {
    _transactionsCollectionReference
        .where('userId', isEqualTo: userId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.documents.isNotEmpty) {
        var newEntries = snapshot.documents
            .map((doc) => AccountTransaction.fromJson(doc.data))
            .toList();

        _transactionController.add(newEntries);
      }
    });
  }

  Future addAccount(Account newAccount) async {
    try {
      await _accountsCollectionReference.add(newAccount.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future updateAccount(Account account) async {
    try {
      await _accountsCollectionReference
          .document(account.documentId)
          .updateData(account.toJson());
    } catch (e) {
      return e.message;
    }
  }
}
