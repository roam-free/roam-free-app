import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/models/filter_group.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:roam_free/ui/views/filters/filters_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:roam_free/services/filter_service.dart';

class FiltersViewModel extends BaseViewModel {
  final HomeService _homeService = locator<HomeService>();
  final FilterService _filterService = locator<FilterService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void initialise() {}

  FilterGroup getFilterGroup(id) {
    FilterGroup filterGroup = _filterService.getFilterGroup(id);

    return filterGroup;
  }

  void refreshHome() {
    _homeService.refreshHome();
  }

  void onSave() {
    refreshHome();
    _navigationService.back();
  }

  void clearFilters(context) async {
    _filterService.resetToDefaults();
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
