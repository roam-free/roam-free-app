import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LocationBoxViewModel extends BaseViewModel {
  final LocationService _locationService = locator<LocationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  String locationText = '';
  final double padding = 5;

  Future initialise() async {
    print('location: start searching');
    List<Placemark> placemarks = await getLocationFromGeoPoint();
    locationText = placemarks[0].locality;
    notifyListeners();
    print('location: $locationText');
  }

  openFilterDrawer(GlobalKey<ScaffoldState> drawerKey) {
    drawerKey.currentState.openDrawer();
  }

  Future<List<Placemark>> getLocationFromGeoPoint() async {
    Position pos = _locationService.currentPostion;
    print('location: $pos');
    List<Placemark> results = await _locationService
        .getPlacemarksFromCoordinates(pos.latitude, pos.longitude);
    return results;
  }

  navigateToLocation() {
    _navigationService.navigateTo(Routes.locationView);
  }
}
