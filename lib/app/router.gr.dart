// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/location/location_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/search/search_view.dart';
import '../ui/views/signup/signup_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/user_account/user_account_view.dart';

class Routes {
  static const String startupView = '/';
  static const String signupView = '/signup-view';
  static const String loginView = '/login-view';
  static const String homeView = '/home-view';
  static const String userAccountView = '/user-account-view';
  static const String searchView = '/search-view';
  static const String locationView = '/location-view';
  static const all = <String>{
    startupView,
    signupView,
    loginView,
    homeView,
    userAccountView,
    searchView,
    locationView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.userAccountView, page: UserAccountView),
    RouteDef(Routes.searchView, page: SearchView),
    RouteDef(Routes.locationView, page: LocationView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    UserAccountView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserAccountView(),
        settings: data,
      );
    },
    SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchView(),
        settings: data,
      );
    },
    LocationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LocationView(),
        settings: data,
      );
    },
  };
}
