import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/services/authentication_service.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:roam_free/services/firestore_service.dart';
import 'package:roam_free/services/google_maps_service.dart';
import 'package:roam_free/services/location_service.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;
final Logger _logger = Logger();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  _logger.i("Authentication Service Started");
  locator.registerLazySingleton(() => FirestoreService());
  _logger.i("Firestore Service Started");
  locator.registerLazySingleton(() => NavigationService());
  _logger.i("Navigation Service Started");
  locator.registerLazySingleton(() => DialogService());
  _logger.i("Dialog Service Service Started");
  locator.registerLazySingleton(() => LocationService());
  _logger.i("Location Service Started");
  locator.registerLazySingleton(() => GoogleMapsService());
  _logger.i("Goolge Maps Service Started");
  locator.registerLazySingleton(() => HomeService());
  _logger.i("Home Service Started");
  locator.registerLazySingleton(() => BottomSheetService());
  _logger.i("Authentication Service Started");
  locator.registerLazySingleton(() => FilterService());
  _logger.i("Filter Service Started");
}
