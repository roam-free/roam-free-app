import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NavBarViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToHome() async {
    await _navigationService.clearStackAndShow(
      Routes.homeView,
    );
  }

  Future navigateToUserAccount() async {
    await _navigationService.navigateTo(
      Routes.userAccountView,
    );
  }
}
