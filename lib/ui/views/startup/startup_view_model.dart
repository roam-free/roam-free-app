import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:roam_free/services/authentication_service.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final LocationService _locationService = locator<LocationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if (hasLoggedInUser) {
      _authenticationService.updateCurrentUser();
      _locationService.requestPermission();
      _locationService.updatePosition();
      _navigationService.navigateTo(Routes.homeView);
    } else {
      _navigationService.navigateTo(Routes.loginView);
    }
  }
}
