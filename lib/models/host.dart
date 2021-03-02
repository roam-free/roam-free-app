import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Host {
  Host(this.name, this.location, this.description, this.id, this.position,
      this.images, this.phone, this.email, this.services, this.activities);

  final String name;
  final String location;
  final String description;
  final String id;
  final GeoPoint position;
  final List images;
  final String phone;
  final String email;
  final Map services;
  final Map activities;

  double distance;

  Position getPosition() {
    Position pos = new Position(
        latitude: position.latitude, longitude: position.longitude);
    return pos;
  }

  LatLng getLatLng() {
    LatLng pos = new LatLng(position.latitude, position.longitude);

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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'description': description,
      'id': id,
      'position': position,
      'images': images,
      'phone': phone,
      'email': email,
      'services': services,
      'activities': activities,
    };
  }
}
