import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:roam_free/services/firestore_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  GlobalKey<ScaffoldState> homeKey = GlobalKey();
  final Logger _logger = Logger();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final LocationService _locationService = locator<LocationService>();
  final HomeService _homeService = locator<HomeService>();
  final FilterService _filterService = locator<FilterService>();
  var hostsStream;

  Position getUserPosition() {
    return _locationService.currentPostion;
  }

  void updateHomeCallback() {
    _logger.i("Updating home with callback");
    notifyListeners();
  }

  Future initialise() async {
    _homeService.refreshHome = updateHomeCallback;
    _locationService.updatePosition();
    hostsStream = _firestoreService.hostStream();
  }

  bool checkFilters(host) {
    return (checkDistance(host) & checkServices(host) & checkActivities(host));
  }

  bool checkDistance(host) {
    double distance = _filterService
        .getFilterGroup(FiltersType.distances)
        .filters['distance']
        .currentValue
        .toDouble();
    return host.distance <= distance;
  }

  bool checkServices(host) {
    bool result = true;
    var hostServices = host.services;
    var filterServices =
        _filterService.getFilterGroup(FiltersType.services).filters;
    filterServices.forEach((id, filter) {
      if (filter.currentValue) {
        if (!hostServices[id]) result = false;
      }
    });

    return result;
  }

  bool checkActivities(host) {
    bool result = true;
    var hostActivities = host.activities;
    var filterActivities =
        _filterService.getFilterGroup(FiltersType.activities).filters;
    filterActivities.forEach((id, filter) {
      if (filter.currentValue) {
        if (!hostActivities[id]) result = false;
      }
    });

    return result;
  }
}
