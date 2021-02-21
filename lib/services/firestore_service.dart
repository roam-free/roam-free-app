import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/models/user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  Stream<List<Host>> hostStream() {
    return _firestore.collection('hosts').snapshots().map((snapshot) {
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
            ),
          )
          .toList();
    });
  }

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return User.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }
}
