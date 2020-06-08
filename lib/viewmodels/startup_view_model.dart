import 'package:debt_tracker/app/locator.dart';
import 'package:debt_tracker/app/router.gr.dart';
import 'package:debt_tracker/services/authentication_service.dart';
import 'package:debt_tracker/services/remote_config_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_core/core.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  RemoteConfigService _remoteConfigService;

  Future handleStartUpLogic() async {
    await locator.allReady();
    _remoteConfigService = locator<RemoteConfigService>();

    SyncfusionLicense.registerLicense(
        _remoteConfigService.getSyncFusionLicenseKey);

    var hasUserLoggedIn = await _authenticationService.isUserLoggedIn();

    if (hasUserLoggedIn) _navigationService.replaceWith(Routes.homeViewRoute);
    // else
    //   _navigationService.replaceWith(Routes.)
  }
}
