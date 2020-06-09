import 'package:auto_route/auto_route_annotations.dart';
import 'package:debt_tracker/ui/views/account_list.dart';
import 'package:debt_tracker/ui/views/add_account_view.dart';
import 'package:debt_tracker/ui/views/startup_view.dart';
import 'package:debt_tracker/ui/views/home_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartUpView startUpViewRoute;
  HomeView homeViewRoute;
  AccountList accountListRoute;
  AddAccountView addAccountViewRoute;
}
