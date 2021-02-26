import 'package:flutter/material.dart';
import 'package:roam_free/models/filter.dart';
import 'package:roam_free/models/filter_group.dart';
import 'package:logger/logger.dart';

Logger _logger = Logger();

enum FiltersType { services, distances, activities }

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
    _filterGroups[FiltersType.activities] = _setupActivitiesFilterGroup();
  }

  FilterGroup _setupServiceFilterGroup() {
    FilterGroup group = new FilterGroup(FiltersType.services, 'Services');

    group.add(
      Filter('dogsAllowed', 'Dogs Allowed', false, Icons.pets),
    );
    group.add(
      Filter('electricity', 'Electricity', false, Icons.electrical_services),
    );
    group.add(
      Filter('freshWater', 'Fresh Water', false, Icons.liquor),
    );
    group.add(
      Filter('greyWater', 'Grey Water', false, Icons.liquor),
    );
    group.add(
      Filter('largeVehicles', 'Large Vehicles', false, Icons.car_rental),
    );
    group.add(
      Filter('litterBins', 'Litter Bins', false, Icons.restore_from_trash),
    );
    group.add(
      Filter('toiletWaste', 'Toilet Waste', false, Icons.wc),
    );
    group.add(
      Filter('wifi', 'WiFi', false, Icons.wifi),
    );

    return group;
  }

  FilterGroup _setupDistanceFilterGroup() {
    FilterGroup group =
        new FilterGroup(FiltersType.distances, 'Distances \(km\)');

    group.add(Filter('distance', 'Distance \(km\)', 100, Icons.add_road));

    return group;
  }

  FilterGroup _setupActivitiesFilterGroup() {
    FilterGroup group = new FilterGroup(FiltersType.activities, 'Actvities');

    group.add(Filter('beach', 'Beach', false, Icons.beach_access));
    group.add(Filter('hiking', 'Hiking', false, Icons.track_changes));
    group.add(Filter('lake', 'Lake', false, Icons.beach_access));
    group.add(Filter('mountain', 'Mountain', false, Icons.landscape));
    group.add(Filter(
        'mountainBiking', 'Mountain Biking', false, Icons.pedal_bike_rounded));
    group.add(Filter('nightLife', 'Night Life', false, Icons.liquor));
    group.add(Filter('rockClimbing', 'RockClimbing', false, Icons.landscape));
    group.add(Filter('waterSports', 'Water Sports', false, Icons.beach_access));

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
