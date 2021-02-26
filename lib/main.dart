import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/ui/setup_bottom_sheet_ui.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/router.gr.dart' as Router;

Logger _logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _logger.i("Firebase initialising");
  await Firebase.initializeApp();
  _logger.i("Firebase initialisation complete");
  setupLocator();
  setupBottomSheetUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Routes are defined here
      navigatorKey: StackedService.navigatorKey,
      initialRoute: Router.Routes.startupView,
      onGenerateRoute: Router.Router().onGenerateRoute,
    );
  }
}
