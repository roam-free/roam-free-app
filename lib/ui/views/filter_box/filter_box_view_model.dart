import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/enums/bottom_sheet_type.dart';

import 'package:roam_free/models/filter_group.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FilterBoxViewModel extends BaseViewModel {
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  HomeService _homeService = locator<HomeService>();
  FilterService _filterService = locator<FilterService>();

  String title;
  String subtitle = 'Nothing Selected';
  ImageProvider image;
  FiltersType filtersRef;

  initialise(incomingFiltersRef) {
    FilterGroup filterGroup = _filterService.getFilterGroup(incomingFiltersRef);
    title = filterGroup.name;
    image = filterGroup.image;
    filtersRef = incomingFiltersRef;
    _updateSelectedInit(filtersRef);
  }

  void onPressed() {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.filters,
        barrierDismissible: true,
        title: title,
        customData: {"ref": filtersRef, "callback": updateSelected});
  }

  void onLongPressed() {}

  void updateSelected(id) {
    _updateSelectedInit(id);
    _homeService.refreshHome();
  }

  void _updateSelectedInit(id) {
    FilterGroup filterGroup = _filterService.getFilterGroup(id);
    String newSubtitle = '';
    filterGroup.filters.forEach(
      (id, filter) {
        if (filter.currentValue) newSubtitle = newSubtitle + '${filter.name}, ';
      },
    );
    subtitle = newSubtitle;
    if (subtitle.isEmpty) subtitle = 'Nothing Selected';
    notifyListeners();
  }
}
