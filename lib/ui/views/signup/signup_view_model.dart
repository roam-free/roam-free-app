import 'package:flutter/foundation.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:roam_free/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final AuthenticationService _authentificationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({
    @required String email,
    @required String password,
    @required String firstName,
    @required String lastName,
  }) async {
    setBusy(true);

    var result = await _authentificationService.signUpWithEmail(
      email: email,
      password: password,
      firstName: firstName.trim(),
      lastName: lastName.trim(),
    );

    setBusy(false);
    if (result is bool) {
      if (result) {
        _navigationService.clearStackAndShow(Routes.homeView);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
