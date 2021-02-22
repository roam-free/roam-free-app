import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/services/google_maps_service.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HostViewModel extends BaseViewModel {
  final GoogleMapsService _googleMapsService = locator<GoogleMapsService>();
  CameraPosition initialCameraPosition;
  Set<Marker> markers = HashSet<Marker>();
  int _markerIdCounter = 1;
  Host host;

  initialise(incomingHost) {
    host = incomingHost;
    initialCameraPosition = CameraPosition(
      target: host.getLatLng(),
      zoom: 15,
    );
    _setMarkers(host.position);
  }

  Future<void> callNow() async {
    String url = 'tel:${host.phone}';
    await launch(url);
  }

  Future<void> emailNow() async {
    String url = 'mailto:${host.email}';
    await launch(url);
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    _googleMapsService.onMapCreated(controller);
    await goToLocation(controller);
  }

  Future<void> goToLocation(GoogleMapController controller) async {
    await _googleMapsService.showInfoWindow(controller, markers.first.markerId);
  }

  void _setMarkers(GeoPoint position) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    LatLng convPosition = new LatLng(position.latitude, position.longitude);

    print(
        'Marker | Latitude: ${position.latitude} Longitude: ${position.longitude}');
    markers.add(
      Marker(
        markerId: MarkerId(markerIdVal),
        position: convPosition,
        infoWindow: InfoWindow(title: 'test'),
        consumeTapEvents: false,
      ),
    );
  }
}
