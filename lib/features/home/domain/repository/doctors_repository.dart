import 'package:dartz/dartz.dart';
import 'package:healthcare_app/core/errors/failure.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

abstract class DoctorsRepository {
  Future<Either<Failure, List<DoctorEntity>>> getPopularDoctor();
}