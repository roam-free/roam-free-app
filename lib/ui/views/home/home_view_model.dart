import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:roam_free/services/firestore_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  GlobalKey<ScaffoldState> homeKey = GlobalKey();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final LocationService _locationService = locator<LocationService>();
  final HomeService _homeService = locator<HomeService>();
  var hostsStream;

  Position getUserPosition() {
    return _locationService.currentPostion;
  }

  void updateHomeCallback() {
    notifyListeners();
  }

  Future initialise() async {
    _homeService.refreshHome = updateHomeCallback;
    _locationService.updatePosition();
    hostsStream = _firestoreService.hostStream();
  }

  double getDistanceFilter() {
    return _homeService.distanceFilters['distance'];
  }

  bool checkDistance(host) {
    return host.distance <= getDistanceFilter();
  }

  bool checkServices(host) {
    bool result = true;
    var hostServices = host.services;
    var homeServices = _homeService.serviceFilters;
    homeServices.forEach((key, value) {
      if (value) {
        print("host service:$key: ${hostServices[key]}");
        if (!hostServices[key]) result = false;
      }
    });
    print("host service:result: ${result}");
    return result;
  }
}
