import 'package:firebase_storage/firebase_storage.dart';

import 'Host.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HostRepository {
  HostRepository(this._firestore) : assert(_firestore != null);

  // ignore: unused_field
  final FirebaseFirestore _firestore;

  Stream<List<Host>> getHosts() {
    return FirebaseFirestore.instance
        .collection('hosts')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((document) => Host(document['name'], document['location'],
              document.id.toString(), document['images']))
          .toList();
    });
  }
}

class ImageRepository {
  ImageRepository(this._storage) : assert(_storage != null);

  // ignore: unused_field
  final FirebaseStorage _storage;

  //Stream<List> getImages() {}
}
