import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorService {
  static CollectionReference doctorCollection =
  FirebaseFirestore.instance.collection('doctor');

  static Future<QuerySnapshot> searchDoctorsByName(String searchKey) {
    return doctorCollection
        .orderBy('name')
        .startAt([searchKey])
        .endAt(['$searchKey\uf8ff'])
        .get();
  }
}
