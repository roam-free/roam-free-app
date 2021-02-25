import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/models/user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference usersCollectionReference =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference hostsCollectionReference =
      FirebaseFirestore.instance.collection("hosts");
  final CollectionReference locationsCollectionReference =
      FirebaseFirestore.instance.collection("locations");

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

  void addUserLocation(String uid, GeoFirePoint location) {
    locationsCollectionReference.doc(uid).set(
      {
        'name': 'user_location',
        'position': location.data,
      },
    );
  }
}
