import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthcare_app/core/services/remote_service.dart';

class FirestoreService implements RemoteService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      await firebaseFirestore.collection(path).doc(docId).set(data);
    } else {
      await firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? id,
    Map<String, dynamic>? query,
  }) async {
    if (id != null) {
      var result = await firebaseFirestore.collection(path).doc(id).get();
      log(result.data()!.toString());
      return {
        ...result.data()!,
        "id": result.id,
      };
    } else {
      Query<Map<String, dynamic>> result = firebaseFirestore.collection(path);
      if (query != null) {
        if (query['limit'] != null) {
          var limit = query['limit'];
          result = result.limit(limit);
        }
      }
      var data = await result.get();

      return data.docs.map((doc) {
        final map = doc.data();
        return {
          ...map,
          "id": doc.id,
        };
      }).toList();
    }
  }

  @override
  Stream<bool> isDoctorFavouriteStream({
    required String path,
    required String docId,
  }) {
    return firebaseFirestore.collection(path).doc(docId).snapshots().map(
          (doc) => doc.exists,
        );
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String id,
  }) async {
    var data = await firebaseFirestore.collection(path).doc(id).get();
    return data.exists;
  }

  @override
  Future<void> removeData({required String path, required String id}) async {
    await firebaseFirestore.collection(path).doc(id).delete();
  }

  static Future<QuerySnapshot> filterDoctorsBySpecialization(
      String specialization) async {
    try {
      return await FirebaseFirestore.instance
          .collection('doctor')
          .where('specialization', isEqualTo: specialization)
          .get();
    } catch (e, stackTrace) {
      log('Error filtering doctors: $e');
      log(stackTrace.toString());
      rethrow;
    }
  }
}
