import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:roam_free/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'Repository.dart';

// Pages
import 'app/router.gr.dart' as R;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<HostRepository>(
        create: (_) => HostRepository(FirebaseFirestore.instance),
        child: MaterialApp(
          // Routes are defined here
          navigatorKey: StackedService.navigatorKey,
          initialRoute: R.Routes.loginView,
          onGenerateRoute: R.Router().onGenerateRoute,
        ));
  }
}
