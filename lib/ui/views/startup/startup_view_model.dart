import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:roam_free/services/authentication_service.dart';

class StartupViewModel extends BaseViewModel {
  final Logger _logger = Logger();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final LocationService _locationService = locator<LocationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if (hasLoggedInUser) {
      await _authenticationService.updateCurrentUser();
      _locationService.requestPermission();
      await _locationService.updatePosition();
      _logger.d("Navigating HomeView");
      _navigationService.clearStackAndShow(Routes.homeView);
    } else {
      _logger.d("Navigating LoginView");
      _navigationService.navigateTo(Routes.loginView);
    }
  }
}
