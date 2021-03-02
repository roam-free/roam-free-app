import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:logger/logger.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/models/user.dart';
import 'package:path/path.dart';

class FirestoreService {
  final Logger _logger = Logger();
  final CollectionReference usersCollectionReference =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference hostsCollectionReference =
      FirebaseFirestore.instance.collection("hosts");
  final CollectionReference locationsCollectionReference =
      FirebaseFirestore.instance.collection("locations");
  final CollectionReference pendingHostsCollectionReference =
      FirebaseFirestore.instance.collection("pendingHosts");

  Stream<List<Host>> hostStream() {
    return hostsCollectionReference.snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (document) => Host(
              document['name'],
              document['location'],
              document['description'],
              document.id.toString(),
              document['position'],
              document['images'],
              document['phone'],
              document['email'],
              document['services'],
              document['activities'],
            ),
          )
          .toList();
    });
  }

  Future createUser(User user) async {
    try {
      await usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await usersCollectionReference.doc(uid).get();
      return User.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }

  Future<void> addUserLocation(String uid, GeoFirePoint location) async {
    try {
      await locationsCollectionReference.doc(uid).set(
        {
          'name': 'user_location',
          'position': location.data,
        },
      );
      _logger.d("$uid location successfully store on firebase");
    } catch (e) {
      _logger.d("$uid location storage failed: ${e.message}");
      return e.message;
    }
  }

  Future<void> createNewHost(Host host) async {
    _logger.i("Pushong new host to server");
    await pendingHostsCollectionReference.doc().set(
          host.toJson(),
        );
  }

  Future<List<Reference>> uploadImages(List<File> files) async {
    List<Reference> refs = [];
    files.forEach(
      (file) async {
        String fileName = basename(file.path);
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child('hostImages/$fileName');
        UploadTask uploadTask = firebaseStorageRef.putFile(file);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        _logger.d("Storage ref: $firebaseStorageRef");
        refs.add(firebaseStorageRef);
      },
    );
    return refs;
  }
}
