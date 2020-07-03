import 'package:debt_tracker/app/locator.dart';
import 'package:debt_tracker/models/account.dart';
import 'package:debt_tracker/services/authentication_service.dart';
import 'package:debt_tracker/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddAccountViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Account _editingAccount;

  bool get editing => _editingAccount != null;

  void setEditingAccount(Account account) => _editingAccount = account;

  Future addAccount(Map<String, dynamic> data) async {
    setBusy(true);
    print(data);

    data['userId'] = _authenticationService.currentUser.userId;
    var result;

    if (!editing) {
      var account = Account.fromJson(data);
      result = await _firestoreService.addAccount(account);
    } else {
      data['documentId'] = _editingAccount.documentId;
      var account = Account.fromJson(data);

      result = await _firestoreService.updateAccount(account);
    }

    setBusy(false);

    if (result is String)
      await _dialogService.showDialog(
        title: 'Could not add account',
        description: result,
      );
    else
      await _dialogService.showDialog(
          title: 'Account successfully added!',
          description: 'Account has been added.');

    _navigationService.back();
  }
}
