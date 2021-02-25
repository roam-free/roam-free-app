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
  Host host;
  var hostsStream;

  Position getUserPosition() {
    return _locationService.currentPostion;
  }

  void setHost(hostToSet) {
    host = hostToSet;
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
    return _homeService.filters[0].value;
  }
}
