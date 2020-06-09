// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:debt_tracker/ui/views/startup_view.dart';
import 'package:debt_tracker/ui/views/home_view.dart';
import 'package:debt_tracker/ui/views/account_list.dart';
import 'package:debt_tracker/ui/views/add_account_view.dart';
import 'package:debt_tracker/models/account.dart';

abstract class Routes {
  static const startUpViewRoute = '/';
  static const homeViewRoute = '/home-view-route';
  static const accountListRoute = '/account-list-route';
  static const addAccountViewRoute = '/add-account-view-route';
  static const all = {
    startUpViewRoute,
    homeViewRoute,
    accountListRoute,
    addAccountViewRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.startUpViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartUpView(),
          settings: settings,
        );
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.accountListRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AccountList(),
          settings: settings,
        );
      case Routes.addAccountViewRoute:
        if (hasInvalidArgs<AddAccountViewArguments>(args)) {
          return misTypedArgsRoute<AddAccountViewArguments>(args);
        }
        final typedArgs =
            args as AddAccountViewArguments ?? AddAccountViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddAccountView(
              key: typedArgs.key, editingAccount: typedArgs.editingAccount),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//AddAccountView arguments holder class
class AddAccountViewArguments {
  final Key key;
  final Account editingAccount;
  AddAccountViewArguments({this.key, this.editingAccount});
}
