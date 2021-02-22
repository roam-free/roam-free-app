import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsService {
  Completer<GoogleMapController> _controller = Completer();
  //Completer<GoogleMapController> get controller => _controller;

  Future<void> goToLocation(GoogleMapController controller, GeoPoint position) {
    LatLng convertedPosition = new LatLng(
      position.latitude,
      position.longitude,
    );

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: convertedPosition,
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
}
