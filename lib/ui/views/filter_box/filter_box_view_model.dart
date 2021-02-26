import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/enums/bottom_sheet_type.dart';
import 'package:roam_free/enums/filters_type.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FilterBoxViewModel extends BaseViewModel {
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  HomeService _homeService = locator<HomeService>();

  String title;
  String subtitle = 'Nothing Selected';
  ImageProvider image;
  FiltersType filtersRef;

  initialise(incomingTitle, incomingImage, incomingFiltersRef) {
    title = incomingTitle;
    image = incomingImage;
    filtersRef = incomingFiltersRef;
    updateSelectedInit();
  }

  void onPressed() {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.filters,
        barrierDismissible: true,
        title: title,
        customData: {"ref": filtersRef, "callback": updateSelected});
  }

  void onLongPressed() {}

  void updateSelected() {
    updateSelectedInit();
    _homeService.refreshHome();
  }

  void updateSelectedInit() {
    var filters = _homeService.serviceFilters;
    String newSubtitle = '';
    filters.forEach(
      (key, value) {
        if (value)
          newSubtitle =
              newSubtitle + '${_homeService.serviceReadableNames[key]}, ';
      },
    );
    subtitle = newSubtitle;
    if (subtitle.isEmpty) subtitle = 'Nothing Selected';
    notifyListeners();
  }
}
