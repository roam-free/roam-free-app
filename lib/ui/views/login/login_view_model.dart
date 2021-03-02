import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:roam_free/services/authentication_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final Logger _logger = Logger();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final LocationService _locationService = locator<LocationService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(
        email: email, password: password);
    setBusy(false);
    if (result is bool) {
      if (result) {
        _logger.i("Login Succesful");
        _navigationService.clearStackAndShow(Routes.homeView);
      } else {
        _logger.i("Login Failed");
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'Couldn\'t login at this moment. Please try again later',
        );
      }
    } else {
      _logger.i("Login Failed: $result");
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  Future signupNow() async {
    _navigationService.navigateTo(Routes.signupView);
  }
}
