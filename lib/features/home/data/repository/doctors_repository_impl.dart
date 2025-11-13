import 'package:dartz/dartz.dart';
import 'package:healthcare_app/core/errors/failure.dart';
import 'package:healthcare_app/core/services/remote_service.dart';
import 'package:healthcare_app/core/utils/remote_paths.dart';
import 'package:healthcare_app/features/home/data/models/doctor_model.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/features/home/domain/repository/doctors_repository.dart';

class DoctorsRepositoryImpl extends DoctorsRepository {
  final RemoteService remoteService;
  DoctorsRepositoryImpl({
    required this.remoteService,
  });
  @override
  Future<Either<Failure, List<DoctorEntity>>> getPopularDoctor() async {
    // TODO: implement getPopularDoctor
    try {
      var data = await remoteService.getData(path: RemotePaths.getPopularDoctor)
          as List<Map<String, dynamic>>;
      print('docotrs_repository_impl $data');
      // List<DoctorModel> result = data.map((e) {
      //   final id = e['id'];
      //   return DoctorModel.fromJson(e, id);
      // }).toList();
      List<DoctorModel> result =
          data.map((e) => DoctorModel.fromJson(e)).toList();
      print('docotrs_repository_impl result $result');
      List<DoctorEntity> popularDoctor =
          result.map((e) => e.toEntity()).toList();
      print('docotrs_repository_impl popularDoctor $popularDoctor');
      return right(popularDoctor);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getFavouriteDoctor() async {
    // TODO: implement getFavoutiteDoctor
    try {
      var data = await remoteService.getData(
          path: RemotePaths.getFavouriteDoctor) as List<Map<String, dynamic>>;
      print('docotrs_repository_impl $data');
      // List<DoctorModel> result = data.map((e) {
      //   final id = e['id'];
      //   return DoctorModel.fromJson(e, id);
      // }).toList();
      List<DoctorModel> result =
          data.map((e) => DoctorModel.fromJson(e)).toList();
      print('docotrs_repository_impl result $result');
      List<DoctorEntity> favouriteDoctor =
          result.map((e) => e.toEntity()).toList();
      print('docotrs_repository_impl popularDoctor $favouriteDoctor');
      return right(favouriteDoctor);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavouriteDoctor({
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    // TODO: implement addFavouriteDoctor
    try {
      bool isExist = await checkIfDataExists(
        id: docId!,
      );
      if (!isExist) {
        await remoteService.addData(
          path: RemotePaths.getFavouriteDoctor,
          data: data,
          docId: docId,
        );
      }

      // ignore: void_checks
      return right(0);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> checkIfDataExists({required String id}) async {
    return await remoteService.checkIfDataExists(
      path: RemotePaths.getFavouriteDoctor,
      id: id,
    );
  }

  @override
  Stream<bool> isDoctorFavouriteStream(String docId) {
    return remoteService.isDoctorFavouriteStream(
      path: RemotePaths.getFavouriteDoctor,
      docId: docId,
    );
  }

  @override
  Future<void> removeFromFavourites({required String id}) async {
    // TODO: implement removeData
    return await remoteService.removeData(
        path: RemotePaths.getFavouriteDoctor, id: id);
  }
}
