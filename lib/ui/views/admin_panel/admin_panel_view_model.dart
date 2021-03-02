import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminPanelViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final String title = 'Admin Panel';

  void addNewHost() {
    _navigationService.navigateTo(Routes.newHostView);
  }

  void manageHosts() {}
}
