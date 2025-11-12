abstract class RemoteService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });

  Future<dynamic> getData({
    required String path,
    String? id,
    Map<String, dynamic>? query,
  });
  Stream<bool> isDoctorFavouriteStream({
    required String path,
    required String docId,
  });
  Future<bool> checkIfDataExists({
    required String path,
    required String id,
  });

  Future<void> removeData({
    required String path,
    required String id,
  });
}
