import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/models/filter_group.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:stacked/stacked.dart';

class FilterBottomSheetViewModel extends BaseViewModel {
  final Logger _logger = Logger();
  final HomeService _homeService = locator<HomeService>();
  final FilterService _filterService = locator<FilterService>();

  FiltersType _filtersRef;
  Function _updateSelectedCallback;
  FilterGroup filterGroup;

  void initialise(customData) {
    _filtersRef = customData['ref'];
    _updateSelectedCallback = customData['callback'];
  }

  void refreshHome() {
    _homeService.refreshHome();
  }

  Widget generateFilters(context) {
    filterGroup = _filterService.getFilterGroup(_filtersRef);

    Widget listView = ListView.builder(
        shrinkWrap: true,
        itemCount: filterGroup.filters.length,
        itemBuilder: (context, index) {
          String key = filterGroup.filters.keys.elementAt(index);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                filterGroup.filters[key].name,
                style: TextStyle(fontSize: 20),
              ),
              Checkbox(
                value: filterGroup.filters[key].currentValue,
                onChanged: (value) => onCheckboxChanged(key, value),
              ),
            ],
          );
        });

    return listView;
  }

  onCheckboxChanged(key, value) {
    _logger.d("Key: $key Value: $value");
    filterGroup.filters[key].currentValue = value;
    _logger.d("Does it get here?");
    _filterService.setFilterGroup(filterGroup);
    _updateSelectedCallback(_filtersRef);
    notifyListeners();
  }
}
