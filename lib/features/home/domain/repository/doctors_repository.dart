import 'package:dartz/dartz.dart';
import 'package:healthcare_app/core/errors/failure.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

abstract class DoctorsRepository {
  Future<Either<Failure, List<DoctorEntity>>> getPopularDoctor();
  Future<Either<Failure, List<DoctorEntity>>> getFavouriteDoctor();
  Future<Either<Failure, void>> addFavouriteDoctor({
    required Map<String, dynamic> data,
    String? docId,
  });

  Future<bool> checkIfDataExists({required String id});
  Stream<bool> isDoctorFavouriteStream(String docId);
  Future<void> removeFromFavourites({
    required String id,
  });
}
