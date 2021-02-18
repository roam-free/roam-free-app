import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roam_free/models/Host.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Host>> hostStream() {
    return _firestore.collection('hosts').snapshots().map((snapshot) {
      return snapshot.docs
          .map((document) => Host(document['name'], document['location'],
              document.id.toString(), document['images']))
          .toList();
    });
  }
}
