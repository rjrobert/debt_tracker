import 'package:auto_route/auto_route_annotations.dart';
import 'package:debt_tracker/ui/pages/startup_view.dart';
import 'package:debt_tracker/ui/pages/home_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartUpView startUpViewRoute;
  HomeView homeViewRoute;
}
