import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class Host {
  Host(this.name, this.location, this.id, this.position, this.images);

  final String name;
  final String location;
  final String id;
  final GeoPoint position;
  final List images;
  double distance;

  Position getPosition() {
    Position pos = new Position(
        latitude: position.latitude, longitude: position.longitude);
    return pos;
  }

  void calculateDistance(userPosition) {
    Position hostPosition = getPosition();
    distance = Geolocator.distanceBetween(
            userPosition.latitude,
            userPosition.longitude,
            hostPosition.latitude,
            hostPosition.longitude) /
        1000;
  }
}
