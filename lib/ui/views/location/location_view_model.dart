import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:geocoding/geocoding.dart';

class LocationViewModel extends BaseViewModel {
  final LocationService _locationService = locator<LocationService>();
  final TextEditingController newLocationController = TextEditingController();
  List<String> locations = [];

  void saveLocation() {}

  Future updateLocationListView() async {
    List<Location> loc = await _locationService
        .getLocationsFromAddress(newLocationController.text);
    loc.forEach(
      (element) async {
        List<Placemark> placemarks = await _locationService
            .getPlacemarksFromCoordinates(element.latitude, element.longitude);
        locations.add(placemarks[0].locality);
      },
    );
    notifyListeners();
  }
}
