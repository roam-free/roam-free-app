import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Position _currentPosition;

  Position get currentPostion => _currentPosition;

  Future updatePosition() async {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == null) await Geolocator.requestPermission();
  }

  Future<double> distanceToHost(Position hostPosition) async {
    //await updatePosition();
    return Geolocator.distanceBetween(
        _currentPosition.latitude,
        _currentPosition.longitude,
        hostPosition.latitude,
        hostPosition.longitude);
  }

  Future<List<Placemark>> getPlacemarksFromCoordinates(
      double latitude, double longitude) async {
    print('location: $latitude, $longitude');
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    return placemarks;
  }

  Future<List<Location>> getLocationsFromAddress(String address) async {
    List<Location> location = await locationFromAddress(address);
    return location;
  }

  void setPositionManual(Position position) {
    _currentPosition = position;
  }
}
