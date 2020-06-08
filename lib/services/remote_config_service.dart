import 'package:injectable/injectable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

@singleton
class RemoteConfigService {
  final RemoteConfig _remoteConfig;

  RemoteConfigService(this._remoteConfig);

  @factoryMethod
  static Future<RemoteConfigService> create() async {
    var remoteConfig = RemoteConfigService(await RemoteConfig.instance);
    await remoteConfig._remoteConfig
        .fetch(expiration: const Duration(seconds: 0));
    await remoteConfig._remoteConfig.activateFetched();
    return remoteConfig;
  }

  String get getSentryDsn => _remoteConfig.getString('sentry_dsn');
  String get getSyncFusionLicenseKey =>
      _remoteConfig.getString('syncfusion_license_key');
}
