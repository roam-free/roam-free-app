import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/google_maps_service.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HostViewModel extends BaseViewModel {
  final GoogleMapsService _googleMapsService = locator<GoogleMapsService>();
  final CameraPosition initialCameraPosition =
      new CameraPosition(target: LatLng(50, -1));

  Future<void> callNow(number) async {
    String url = 'tel:$number';
    await launch(url);
  }

  Future<void> emailNow(email) async {
    String url = 'mailto:$email';
    await launch(url);
  }

  Future<void> onMapCreated(controller) {
    _googleMapsService.onMapCreated(controller);
  }
}
