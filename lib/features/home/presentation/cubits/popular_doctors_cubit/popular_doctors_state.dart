import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

sealed class PopularDoctorsState {}

final class PopularDoctorsInitial extends PopularDoctorsState {}

final class PopularDoctorsLoading extends PopularDoctorsState {}

final class PopularDoctorsFailure extends PopularDoctorsState {
  final String errMassage;
  PopularDoctorsFailure(this.errMassage);
}

final class PopularDoctorsSuccess extends PopularDoctorsState {
  final List<DoctorEntity> popularDoctors;
  PopularDoctorsSuccess(this.popularDoctors);
}
