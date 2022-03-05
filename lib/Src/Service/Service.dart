import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/Src/Data/ProfileInfo.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

// create a future to add the form info of person to firestore by our data model.
  Future<void> addProfile(ProfileInfo pro) async {
    await _firebaseFirestore.collection('profile').add(pro.toMap());
  }
}
