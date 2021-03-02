import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/models/filter_group.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:stacked/stacked.dart';

class NewHostBottomSheetViewModel extends BaseViewModel {
  final Logger _logger = Logger();

  FiltersType _ref;
  Function _updateSelectedCallback;

  FilterGroup selectionGroup;

  void initialise(customData) {
    _ref = customData['ref'];
    _updateSelectedCallback = customData['callback'];
    selectionGroup = customData['group'];
  }

  Widget generateSelection(context) {
    _logger.d("SelctionGroup: $selectionGroup");
    Widget listView = ListView.builder(
        shrinkWrap: true,
        itemCount: selectionGroup != null ? selectionGroup.filters.length : 0,
        itemBuilder: (context, index) {
          String key = selectionGroup.filters.keys.elementAt(index);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectionGroup.filters[key].name,
                style: TextStyle(fontSize: 20),
              ),
              Checkbox(
                value: selectionGroup.filters[key].currentValue,
                onChanged: (value) => onCheckboxChanged(key, value),
              ),
            ],
          );
        });

    return listView;
  }

  onCheckboxChanged(key, value) {
    _logger.d("Key: $key Value: $value");
    selectionGroup.filters[key].currentValue = value;
    _logger.d("Does it get here?");
    _updateSelectedCallback(_ref, selectionGroup);
    notifyListeners();
  }
}
