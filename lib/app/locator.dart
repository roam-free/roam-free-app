import 'package:get_it/get_it.dart';
import 'package:roam_free/services/authentication_service.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:roam_free/services/firestore_service.dart';
import 'package:roam_free/services/google_maps_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => GoogleMapsService());
  locator.registerLazySingleton(() => HomeService());
  locator.registerLazySingleton(() => BottomSheetService());
}
