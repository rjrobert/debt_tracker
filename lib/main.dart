import 'package:catcher/core/catcher.dart';
import 'package:debt_tracker/app/appconstants.dart';
import 'package:debt_tracker/app/locator.dart';
import 'package:debt_tracker/app/logger.dart';
import 'package:debt_tracker/app/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  Catcher(
    MyApp(),
    debugConfig: loggerDebugOptions,
    releaseConfig: loggerReleaseOptions,
    navigatorKey: locator<NavigationService>().navigatorKey,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: Routes.startUpViewRoute,
    );
  }
}
