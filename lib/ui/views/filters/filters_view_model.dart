import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:roam_free/ui/views/filters/filters_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FiltersViewModel extends BaseViewModel {
  final HomeService _homeService = locator<HomeService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void initialise() {}

  Map<String, double> getDistanceFilters() {
    return _homeService.distanceFilters;
  }

  void refreshHome() {
    _homeService.refreshHome();
  }

  void onSave() {
    refreshHome();
    _navigationService.back();
  }

  void clearFilters(context) async {
    _homeService.serviceFilters.forEach((key, value) {
      _homeService.serviceFilters[key] = false;
    });
    _homeService.distanceFilters['distance'] = 100;
    _homeService.refreshHome();
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => FiltersView(),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }
}
