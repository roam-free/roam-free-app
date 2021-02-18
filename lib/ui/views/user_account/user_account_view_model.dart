import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:roam_free/app/router.gr.dart';

class UserAccountViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signOut() async {
    _authenticationService.signOut();
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
