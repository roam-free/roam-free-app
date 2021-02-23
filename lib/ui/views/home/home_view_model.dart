import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:roam_free/app/locator.dart';

import 'package:roam_free/services/firestore_service.dart';
import 'package:roam_free/services/google_maps_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final LocationService _locationService = locator<LocationService>();

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  var distance;
  var hostsStream;

  Position getUserPosition() {
    return _locationService.currentPostion;
  }

  Future initialise() async {
    hostsStream = _firestoreService.hostStream();
    _locationService.updatePosition();
  }
}
