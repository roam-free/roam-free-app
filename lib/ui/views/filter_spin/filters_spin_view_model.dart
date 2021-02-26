import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/enums/filters_type.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:stacked/stacked.dart';

class FiltersSpinViewModel extends BaseViewModel {
  HomeService _homeService = locator<HomeService>();

  String title;
  String subtitle = 'Nothing Selected';
  ImageProvider image;
  FiltersType filtersRef;
  double currentDistance;

  initialise(incomingTitle, incomingImage, incomingFiltersRef) {
    currentDistance = _homeService.distanceFilters['distance'];
    title = incomingTitle;
    image = incomingImage;
    filtersRef = incomingFiltersRef;
  }

  void onChanged(value) {
    print("distance: $value");
    currentDistance = value;
    _homeService.distanceFilters['distance'] = value;
    notifyListeners();
    _homeService.refreshHome();
  }
}
