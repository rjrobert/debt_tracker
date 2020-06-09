import 'package:debt_tracker/app/locator.dart';
import 'package:debt_tracker/app/router.gr.dart';
import 'package:debt_tracker/models/user.dart';
import 'package:debt_tracker/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User get currentUser => _authenticationService.currentUser;

  void gotoAccountList() {
    _navigationService.navigateTo(Routes.accountListRoute);
  }
}
