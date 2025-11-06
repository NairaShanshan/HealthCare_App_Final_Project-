import 'package:get_it/get_it.dart';
import 'package:healthcare_app/core/services/firestore_service.dart';
import 'package:healthcare_app/core/services/remote_service.dart';
import 'package:healthcare_app/features/home/data/repository/doctors_repository_impl.dart';
import 'package:healthcare_app/features/home/domain/repository/doctors_repository.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<RemoteService>(FirestoreService());
  getIt.registerSingleton<DoctorsRepository>(
    DoctorsRepositoryImpl(remoteService: getIt.get<RemoteService>())
  );
}
