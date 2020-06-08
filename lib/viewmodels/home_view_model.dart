import 'package:debt_tracker/app/locator.dart';
import 'package:debt_tracker/services/remote_config_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final RemoteConfigService remoteConfigService =
      locator<RemoteConfigService>();

  String get sentryDsn => remoteConfigService.getSentryDsn;
  String get syncFusionKey => remoteConfigService.getSyncFusionLicenseKey;
}
