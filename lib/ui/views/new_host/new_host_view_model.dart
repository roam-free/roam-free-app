import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:roam_free/enums/bottom_sheet_type.dart';
import 'package:roam_free/models/filter_group.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:roam_free/services/google_maps_service.dart';
import 'package:roam_free/ui/widgets/add_image_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewHostViewModel extends BaseViewModel {
  final GoogleMapsService _googleMapsService = locator<GoogleMapsService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final FilterService _filterService = locator<FilterService>();
  final ImagePicker _picker = ImagePicker();
  final Logger _logger = Logger();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final servicesController = TextEditingController();
  final activitiesController = TextEditingController();
  LatLng location;
  FilterGroup servicesGroup;
  FilterGroup activitiesGroup;
  List<File> images = [];
  int imageCount = 0;

  void initialise() {
    servicesGroup = _filterService.setupServiceFilterGroup();
    activitiesGroup = _filterService.setupActivitiesFilterGroup();
  }

  Future chooseImage() async {
    _logger.d("chooseImage() Called");
    final pickedImage = await _picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      images.add(File(pickedImage.path));
      _logger.i("${pickedImage.path}");
      imageCount++;
      notifyListeners();
    } else {
      _logger.i("No image selected");
    }
    _logger.d("List of images: ${images}");
  }

  Future<List<Widget>> generateImageGrid() async {
    _logger.i("generateImageGrid() running");
    if (images.isNotEmpty) {
      List<Widget> grid = [];
      images.asMap().forEach(
        (index, image) {
          grid.add(
            FlatButton(
              onPressed: () => selectImage(index),
              child: Image.file(
                image,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
      if (imageCount < 6) {
        grid.add(
          AddImageButton(
            onPressed: () => chooseImage(),
          ),
        );
      }
      _logger.i("Grid: $grid");
      return grid;
    }

    return [
      AddImageButton(
        onPressed: () => chooseImage(),
      )
    ];
  }

  void selectImage(index) {
    images.removeAt(index);
    imageCount--;
    notifyListeners();
  }

  Future<void> selectLocation(context) async {
    Prediction prediction = await _googleMapsService.searchPlaces(
      context: context,
      language: "en",
      mode: Mode.fullscreen,
    );
    locationController.text = prediction?.description;
    if (prediction != null) {
      location = await _googleMapsService.getLatLngFromPrediction(prediction);
    }
    notifyListeners();
  }

  void selectServices() {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.newHost,
        barrierDismissible: true,
        title: 'Services',
        customData: {
          "ref": FiltersType.services,
          "callback": updateSelected,
          "group": servicesGroup
        });
  }

  void selectActivities() {
    _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.newHost,
        barrierDismissible: true,
        title: 'Activities',
        customData: {
          "ref": FiltersType.activities,
          "callback": updateSelected,
          "group": activitiesGroup
        });
  }

  void updateSelected(FiltersType ref, FilterGroup filterGroup) {
    switch (ref) {
      case FiltersType.services:
        servicesGroup = filterGroup;
        servicesController.text = servicesGroup.getNamesByEnabled();
        break;
      case FiltersType.activities:
        activitiesGroup = filterGroup;
        activitiesController.text = activitiesGroup.getNamesByEnabled();
        break;
      default:
        break;
    }
  }

  Future<void> save() async {
    List<Reference> imageRefs;

    imageRefs = await _firestoreService.uploadImages(images);

    Host host = Host(
      nameController.text,
      locationController.text,
      descriptionController.text,
      '',
      GeoPoint(location.latitude, location.longitude),
      imageRefs,
      phoneController.text,
      emailController.text,
      servicesGroup.toMap(),
      activitiesGroup.toMap(),
    );
    _firestoreService.createNewHost(host);
  }
}
