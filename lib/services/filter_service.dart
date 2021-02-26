import 'package:flutter/material.dart';
import 'package:roam_free/models/filter.dart';
import 'package:roam_free/models/filter_group.dart';
import 'package:logger/logger.dart';

Logger _logger = Logger();

enum FiltersType {
  services,
  distances,
}

class FilterService {
  Map<FiltersType, FilterGroup> _filterGroups = Map();
  Map<FiltersType, FilterGroup> get filterGroups => _filterGroups;

  FilterGroup getFilterGroup(FiltersType id) {
    return _filterGroups[id];
  }

  void setFilterGroup(filterGroup) {
    FiltersType id = filterGroup.id;

    _filterGroups[id] = filterGroup;
  }

  void setupFilters() {
    _logger.i("Setting up Filters");
    _filterGroups[FiltersType.services] = _setupServiceFilterGroup();
    _filterGroups[FiltersType.distances] = _setupDistanceFilterGroup();
  }

  FilterGroup _setupServiceFilterGroup() {
    FilterGroup group = new FilterGroup(FiltersType.services, 'Services');

    group.add(Filter('dogsAllowed', 'Dogs Allowed', false, Icons.pets));
    group.add(
        Filter('electricity', 'Electricity', false, Icons.electrical_services));
    group.add(Filter('freshWater', 'Fresh Water', false, Icons.liquor));
    group.add(Filter('greyWater', 'Grey Water', false, Icons.liquor));
    group.add(
        Filter('largeVehicles', 'Large Vehicles', false, Icons.car_rental));
    group.add(
        Filter('litterBins', 'Litter Bins', false, Icons.restore_from_trash));
    group.add(Filter('toiletWaste', 'Toilet Waste', false, Icons.wc));
    group.add(Filter('wifi', 'WiFi', false, Icons.wifi));

    return group;
  }

  FilterGroup _setupDistanceFilterGroup() {
    FilterGroup group =
        new FilterGroup(FiltersType.distances, 'Distances \(km\)');

    group.add(Filter('distance', 'Distance \(km\)', 100, Icons.add_road));

    return group;
  }

  void resetToDefaults() {
    _filterGroups.forEach((_, filterGroup) {
      filterGroup.filters.forEach((__, filter) {
        filter.restToDefault();
      });
    });
  }
}
