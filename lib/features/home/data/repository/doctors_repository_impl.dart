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
      List<DoctorModel> result = data.map((e) {
        final id = e['id'];
        return DoctorModel.fromJson(e, id);
      }).toList();
      print('docotrs_repository_impl result $result');
      List<DoctorEntity> popularDoctor =
          result.map((e) => e.toEntity()).toList();
      print('docotrs_repository_impl popularDoctor $popularDoctor');
      return right(popularDoctor);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
