import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsService {
  Completer<GoogleMapController> _controller = Completer();

  //Completer<GoogleMapController> get controller => _controller;

  Future<void> goToLocation(
      GoogleMapController controller, GeoPoint position) async {
    LatLng convertedPosition = new LatLng(
      position.latitude,
      position.longitude,
    );
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: convertedPosition,
          zoom: 12,
        ),
      ),
    );
  }

  Future<void> showInfoWindow(GoogleMapController controller, markerId) async {
    await controller.showMarkerInfoWindow(markerId);
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  setMarker(GeoPoint position) {}
}
