import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/enums/filters_type.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:stacked/stacked.dart';

class FilterBottomSheetViewModel extends BaseViewModel {
  final HomeService _homeService = locator<HomeService>();

  FiltersType _filtersRef;
  Function _updateSelectedCallback;
  Map filters;

  void initialise(customData) {
    _filtersRef = customData['ref'];
    _updateSelectedCallback = customData['callback'];
  }

  void refreshHome() {
    _homeService.refreshHome();
  }

  Widget generateFilters(context) {
    filters = _homeService.getFilters(_filtersRef);

    Widget listView = ListView.builder(
        shrinkWrap: true,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          String key = filters.keys.elementAt(index);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _homeService.serviceReadableNames[key],
                style: TextStyle(fontSize: 20),
              ),
              Checkbox(
                value: filters[key],
                onChanged: (value) => onCheckboxChanged(key, value),
              ),
            ],
          );
        });

    return listView;
  }

  onCheckboxChanged(key, value) {
    filters[key] = value;
    _homeService.setFilters(_filtersRef, filters);
    _updateSelectedCallback();
    notifyListeners();
  }
}
