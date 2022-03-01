import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/Src/Data/ProfileInfo.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addACar(ProfileInfo pro) async {
    await _firebaseFirestore.collection('cars').add(pro.toMap());
  }

  // Stream of cars
  Stream<List<ProfileInfo>> fetchCarsData() {
    return _firebaseFirestore.collection('profile').snapshots().map((event) {
      debugPrint('docs length =======>' + event.docs.length.toString());

      return event.docs
          .map(
            (doc) => ProfileInfo.fromMap(
              doc.data(),
            ),
          )
          .toList();
    });
  }

  Future<List<ProfileInfo>> fetchCarsUsingFuture() async {
    return await _firebaseFirestore.collection('profile').get().then(
          (snapshot) => snapshot.docs
              .map(
                (e) => ProfileInfo.fromMap(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

  Future<ProfileInfo> getASpecificCar(carId) async {
    return await _firebaseFirestore
        .collection('profile')
        .doc(carId)
        .get()
        .then((doc) => ProfileInfo.fromMap(doc.data() as Map<String, dynamic>));
  }

  Future<ProfileInfo> getCarWithPlateNumber(String plateNumber) async {
    return await _firebaseFirestore
        .collection('profile')
        .where('title', isEqualTo: plateNumber)
        .get()
        .then((snapshot) => snapshot.docs
            .map(
              (e) => ProfileInfo.fromMap(
                e.data(),
              ),
            )
            .toList()
            .first);
  }
}
