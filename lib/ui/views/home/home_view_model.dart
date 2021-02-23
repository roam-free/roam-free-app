import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:roam_free/services/firestore_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  GlobalKey<ScaffoldState> homeKey = GlobalKey();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final LocationService _locationService = locator<LocationService>();
  final FilterService _filterService = locator<FilterService>();
  Host host;
  var hostsStream;

  Position getUserPosition() {
    return _locationService.currentPostion;
  }

  void setHost(hostToSet) {
    host = hostToSet;
  }

  void updateDistancesCallback() {
    notifyListeners();
  }

  Future initialise() async {
    hostsStream = _firestoreService.hostStream();
    _locationService.updatePosition();
    _locationService.addUserLocation();
  }

  double getDistanceFilter() {
    return _filterService.filters[0].value;
  }
}
