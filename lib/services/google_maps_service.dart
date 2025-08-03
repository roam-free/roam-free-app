import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class GoogleMapsService {
  Completer<GoogleMapController> _controller = Completer();
  final kGoogleApiKey = "redacted";

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

  Future<Prediction> searchPlaces({
    @required BuildContext context,
    @required String language,
    @required Mode mode,
  }) async {
    Prediction prediction = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        mode: mode, // Mode.fullscreen / Mode.overlay
        language: language,
        components: [new Component(Component.country, "uk")]);

    return prediction;
  }

  Future<LatLng> getLatLngFromPrediction(Prediction prediction) async {
    GoogleMapsPlaces _places = new GoogleMapsPlaces(apiKey: kGoogleApiKey);
    if (prediction != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(prediction.placeId);
      double latitude = detail.result.geometry.location.lat;
      double longitude = detail.result.geometry.location.lng;
      return LatLng(latitude, longitude);
    } else {
      return null;
    }
  }
}
