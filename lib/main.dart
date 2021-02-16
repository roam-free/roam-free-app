import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Repository.dart';
import 'UserRegistrationAndLogin.dart';

// Pages
import 'Home.dart';
import 'EditHostsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<HostRepository>(
        create: (_) => HostRepository(FirebaseFirestore.instance),
        child: MaterialApp(
            // Routes are defined here
            initialRoute: Home.id,
            routes: {
              Home.id: (context) => Home(),
              EditHostsPage.id: (context) => EditHostsPage(),
              UserLogin.id: (context) => UserLogin(),
            }));
  }
}
