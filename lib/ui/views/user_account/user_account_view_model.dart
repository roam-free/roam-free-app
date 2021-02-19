import 'package:geolocator/geolocator.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/authentication_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:roam_free/models/user.dart';

class UserAccountViewModel extends BaseViewModel {
  User user;
  final title = 'Account';
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final LocationService _locationService = locator<LocationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<bool> signOut() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    if (hasLoggedInUser) {
      _authenticationService.signOut();
      _navigationService.clearStackAndShow(Routes.loginView);
      return true;
    }
    return false;
  }

  Future initialise() async {
    _updateUser();
  }

  String getName() {
    _updateUser();
    var name = '${user?.firstName} ${user?.lastName}';
    return name;
  }

  String getEmail() {
    _updateUser();
    var email = '${user?.email}';
    return email;
  }

  Position getLocation() {
    _locationService.updatePosition();
    return _locationService.currentPostion;
  }

  Future _updateUser() async {
    user = _authenticationService.currentUser;
  }
}
