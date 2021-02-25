import 'package:flutter/material.dart';
import 'package:roam_free/enums/filters_type.dart';

class HomeService {
  //----------------------------------------------------------------------------
  // Filters
  //----------------------------------------------------------------------------
  Map getFilters(ref) {
    switch (ref) {
      case FiltersType.services:
        return _serviceFilters;
      case FiltersType.distances:
        return _distanceFilters;
      default:
        throw Error();
    }
  }

  void setFilters(FiltersType ref, Map filters) {
    switch (ref) {
      case FiltersType.services:
        _serviceFilters = filters;
        break;
      default:
        throw Error();
    }
  }

  //----------------------------------------------------------------------------
  // Distance Filters
  //----------------------------------------------------------------------------
  Map<String, double> get distanceFilters => _distanceFilters;
  set distanceFilters(filters) => _distanceFilters;
  Map<String, double> _distanceFilters = {
    "distance": 100,
  };

  //----------------------------------------------------------------------------
  // Service Filters
  //----------------------------------------------------------------------------
  Map<String, bool> get serviceFilters => _serviceFilters;
  set serviceFilters(filters) => _serviceFilters = filters;
  Map<String, bool> _serviceFilters = {
    "dogsAllowed": false,
    "electricity": false,
    "freshWater": false,
    "greyWater": false,
    "largeVehicles": false,
    "litterBins": false,
    "toiletWaste": false,
    "wifi": false
  };

  Map<String, IconData> get serviceIcons => _serviceIcons;
  Map<String, IconData> _serviceIcons = {
    "dogsAllowed": Icons.pets,
    "electricity": Icons.electrical_services,
    "freshWater": Icons.liquor,
    "greyWater": Icons.liquor,
    "largeVehicles": Icons.car_rental,
    "litterBins": Icons.restore_from_trash,
    "toiletWaste": Icons.wc,
    "wifi": Icons.wifi,
  };

  Map<String, String> get serviceReadableNames => _servicereadableNames;
  Map<String, String> _servicereadableNames = {
    "dogsAllowed": 'Dogs Allowed',
    "electricity": 'Electricity',
    "freshWater": 'Fresh Water',
    "greyWater": 'Grey Water',
    "largeVehicles": 'Large Vehicles',
    "litterBins": 'Litter Bins',
    "toiletWaste": 'Toilet Waste',
    "wifi": 'WiFi'
  };

  //----------------------------------------------------------------------------
  // Callbacks
  //----------------------------------------------------------------------------
  Function refreshHome;
}
