import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/firestore_service.dart';

class LocationService {
  final Logger _logger = Logger();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final geo = Geoflutterfire();

  Position _currentPosition;
  Position get currentPostion => _currentPosition;

  Future updatePosition() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _logger.d("Updating position from device");
    } catch (e) {
      _logger.d("Failed to update location from device");
      return e.message;
    }
    //addUserLocation();
  }

  void requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == null) {
      _logger.d('Requesting Location permissions');
      await Geolocator.requestPermission();
    }
  }

  Future<double> distanceToHost(Position hostPosition) async {
    //await updatePosition();
    try {
      var distance = Geolocator.distanceBetween(
          _currentPosition.latitude,
          _currentPosition.longitude,
          hostPosition.latitude,
          hostPosition.longitude);
      _logger.d('Calculating distance to host successful: ${distance}km');
      return distance;
    } catch (e) {
      return e.message;
    }
  }

  Future<List<Placemark>> getPlacemarksFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      _logger.d("Got placemarks from coordinates successfully");
      return placemarks;
    } catch (e) {
      _logger.d("Getting placemarks from coordinates failed");

      return e.message;
    }
  }

  Future<List<Location>> getLocationsFromAddress(String address) async {
    try {
      List<Location> location = await locationFromAddress(address);
      _logger.d("Got location from address successfully");
      return location;
    } catch (e) {
      _logger.d("Getting Location from Address failed");
      return e.message;
    }
  }

  void setPositionManual(Position position) {
    _currentPosition = position;
    _logger.d("setting Position manually: $position");
    //addUserLocation();
  }

  Future<void> addUserLocation() async {
    GeoFirePoint location = geo.point(
        latitude: _currentPosition.latitude,
        longitude: _currentPosition.longitude);
    await _firestoreService.addUserLocation(
        '9f7lVSYMTRgASx80WPuw2IJpfic2', location);
  }
}
