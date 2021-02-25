import 'package:flutter/material.dart';

import 'package:roam_free/models/filter.dart';

class HomeService {
  List<Filter> filters = [
    Filter('Distance'),
  ];

  Function refreshHome;

  Map<String, IconData> setupServiceIcons() {
    Map<String, IconData> serviceIcons = Map();

    serviceIcons['dogsAllowed'] = Icons.pets;
    serviceIcons['electricity'] = Icons.electrical_services;
    serviceIcons['freshWater'] = Icons.liquor;
    serviceIcons['greyWater'] = Icons.liquor;
    serviceIcons['largeVehicles'] = Icons.car_rental;
    serviceIcons['litterBins'] = Icons.restore_from_trash;
    serviceIcons['toiletWaste'] = Icons.wc;
    serviceIcons['wifi'] = Icons.wifi;

    return serviceIcons;
  }

  String readableLabel(String key) {
    switch (key) {
      case 'dogsAllowed':
        return 'Dogs Allowed';
      case 'electricity':
        return 'Electricity';
      case 'freshWater':
        return 'Fresh Water';
      case 'greyWater':
        return 'Grey Water';
      case 'largeVehicles':
        return 'Large Vehicles';
      case 'litterBins':
        return 'Litter Bins';
      case 'toiletWaste':
        return 'Toilet Waste';
      case 'wifi':
        return 'WiFi';
      default:
        return key;
    }
  }
}
