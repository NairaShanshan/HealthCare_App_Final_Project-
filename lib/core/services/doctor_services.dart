import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/appointment/data/models/appointment_model.dart';

class DoctorService {
  static CollectionReference doctorCollection =
  FirebaseFirestore.instance.collection('doctor');

  static CollectionReference appointmentCollection = FirebaseFirestore.instance
      .collection('appointment');

  static Future<QuerySnapshot> searchDoctorsByName(String searchKey) {
    return doctorCollection
        .orderBy('name')
        .startAt([searchKey])
        .endAt(['$searchKey\uf8ff'])
        .get();
  }


  static Future<void> createAppointment(AppointmentModel appointmentData) {
    return appointmentCollection.doc().set(appointmentData.toJson());
  }

  static Future<QuerySnapshot> getAppointmentsByPatientId() {
    String patientId = FirebaseAuth.instance.currentUser?.uid ?? "";
    return appointmentCollection.where("patientID", isEqualTo: patientId).get();
  }

  static Future<void> getAppointmentsByDoctorId() {
    String doctorId = FirebaseAuth.instance.currentUser?.uid ?? "";
    return appointmentCollection.where("doctorID", isEqualTo: doctorId).get();
  }

  static Future<void> deleteAppointment(String docID) {
    return appointmentCollection.doc(docID).delete();
  }
}
