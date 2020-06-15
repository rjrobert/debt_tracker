import 'package:debt_tracker/app/locator.dart';
import 'package:debt_tracker/app/router.gr.dart';
import 'package:debt_tracker/models/account.dart';
import 'package:debt_tracker/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountListViewModel extends StreamViewModel<List<Account>> {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Stream<List<Account>> get stream => _firestoreService.accounts;

  Future navigateToAddAccountView() async {
    await _navigationService.navigateTo(Routes.addAccountViewRoute);
  }
}
