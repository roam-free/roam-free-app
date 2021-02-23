import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:roam_free/models/user.dart';
import 'package:roam_free/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MenuViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  User user;
  ImageProvider profilePicture = AssetImage('assets/images/profile_pic.png');

  Future initialise() async {
    await getCurrentUser();
    if (user.profilePicture == "null") {
      print('using default profile picture');
    } else {
      CachedNetworkImageProvider(user.profilePicture);
    }
  }

  Future navigateToHome() async {
    _navigationService.popRepeated(1);
    _navigationService.navigateTo(Routes.homeView);
  }

  Future navigateToUserAccount() async {
    _navigationService.popRepeated(1);
    _navigationService.clearTillFirstAndShow(Routes.userAccountView);
  }

  Future getCurrentUser() async {
    user = _authenticationService.currentUser;
  }
}
