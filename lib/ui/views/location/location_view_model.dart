import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/google_maps_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:geocoding/geocoding.dart';

class LocationViewModel extends BaseViewModel {
  final LocationService _locationService = locator<LocationService>();
  final TextEditingController newLocationController = TextEditingController();
  final GoogleMapsService _googleMapsService = locator<GoogleMapsService>();
  Prediction prediction;

  Future<void> searchPlaces(context) async {
    prediction = await _googleMapsService.searchPlaces(context, "en");
  }

  void saveLocation() {}
}
