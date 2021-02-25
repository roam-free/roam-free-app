import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:roam_free/enums/bottom_sheet_type.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:roam_free/services/google_maps_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LocationBoxViewModel extends BaseViewModel {
  final LocationService _locationService = locator<LocationService>();
  final GoogleMapsService _googleMapsService = locator<GoogleMapsService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final HomeService _homeService = locator<HomeService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Prediction prediction;
  String locationText = '';
  final double padding = 5;

  Future initialise() async {
    locationText = await getLocationFromCurrentPosition();
    notifyListeners();
  }

  openFilterDrawer(GlobalKey<ScaffoldState> homeKey) {
    homeKey.currentState.openDrawer();
  }

  Future openFilterBottomSheet() async {
    // _bottomSheetService.showCustomSheet(
    //   variant: BottomSheetType.filters,
    //   barrierDismissible: true,
    // );
    _navigationService.navigateTo(Routes.filtersView);
  }

  refreshHome() {
    _homeService.refreshHome();
  }

  Future<String> getLocationFromCurrentPosition() async {
    Position pos = _locationService.currentPostion;

    List<Placemark> results = await _locationService
        .getPlacemarksFromCoordinates(pos.latitude, pos.longitude);
    String location = results[0].locality;
    return location;
  }

  Future<void> searchPlaces(context) async {
    prediction = await _googleMapsService.searchPlaces(context, "en");
    LatLng position =
        await _googleMapsService.getLatLngFromPrediction(prediction);
    Position convPosition =
        Position(latitude: position.latitude, longitude: position.longitude);
    _locationService.setPositionManual(convPosition);
    locationText = await getLocationFromCurrentPosition();
    refreshHome();
    notifyListeners();
  }
}
