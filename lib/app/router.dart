import 'package:auto_route/auto_route_annotations.dart';
import 'package:roam_free/ui/views/admin_panel/admin_panel_view.dart';
import 'package:roam_free/ui/views/filters/filters_view.dart';
import 'package:roam_free/ui/views/home/home_view.dart';

import 'package:roam_free/ui/views/login/login_view.dart';
import 'package:roam_free/ui/views/new_host/new_host_view.dart';
import 'package:roam_free/ui/views/search/search_view.dart';
import 'package:roam_free/ui/views/signup/signup_view.dart';
import 'package:roam_free/ui/views/startup/startup_view.dart';
import 'package:roam_free/ui/views/user_account/user_account_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: UserAccountView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: FiltersView),
    MaterialRoute(page: AdminPanelView),
    MaterialRoute(page: NewHostView),
  ],
)
class $Router {}

// Below commands to generate router file
// flutter packages pub run build_runner watch

// flutter packages pub run build_runner build
