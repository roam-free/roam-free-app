import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/models/filter.dart';
import 'package:roam_free/models/filter_group.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:stacked/stacked.dart';

class FiltersSpinViewModel extends BaseViewModel {
  final Logger _logger = Logger();
  final HomeService _homeService = locator<HomeService>();
  final FilterService _filterService = locator<FilterService>();

  String title;
  String subtitle = 'Nothing Selected';
  ImageProvider image;
  FiltersType filtersRef;
  String filterId;
  double currentDistance;
  FilterGroup filterGroup;
  Filter filter;

  initialise(FiltersType incomingFiltersRef, String filterId) {
    filterGroup = _filterService.getFilterGroup(incomingFiltersRef);
    _logger.d("${_filterService.filterGroups}");
    filter = filterGroup.filters[filterId];
    _logger.d("Current Value: ${filter.currentValue}");
    currentDistance = filter.currentValue.toDouble();
    title = filterGroup.name;
    image = filterGroup.image;
    filtersRef = incomingFiltersRef;
  }

  void onChanged(double value) {
    print("distance: $value");
    currentDistance = value;
    filter.currentValue = value;
    filterGroup.filters[filterId] = filter;
    _filterService.setFilterGroup(filterGroup);
    notifyListeners();
    _homeService.refreshHome();
  }
}
