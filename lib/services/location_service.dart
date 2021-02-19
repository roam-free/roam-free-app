import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationService {
  Position _currentPosition;

  Position get currentPostion => _currentPosition;

  StreamSubscription<Position> positionStream =
      Geolocator.getPositionStream().listen((Position position) {
    // print(position == null
    //     ? 'Unknown'
    //     : position.latitude.toString() + ', ' + position.longitude.toString());
  });

  Future updatePosition() async {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == null) await Geolocator.requestPermission();
  }

  Future<double> distanceToHost(Position hostPosition) async {
    await updatePosition();
    return Geolocator.distanceBetween(
        _currentPosition.latitude,
        _currentPosition.longitude,
        hostPosition.latitude,
        hostPosition.longitude);
  }
}
