import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

sealed class FavouriteDoctorsState {}

final class FavouriteDoctorsInitial extends FavouriteDoctorsState {}

final class FavouriteDoctorsLoading extends FavouriteDoctorsState {}
final class AddFavouriteDoctorsLoading extends FavouriteDoctorsState {}

final class FavouriteDoctorsFailure extends FavouriteDoctorsState {
  final String errMassage;
  FavouriteDoctorsFailure(this.errMassage);
}
final class AddFavouriteDoctorsFailure extends FavouriteDoctorsState {
  final String errMassage;
  AddFavouriteDoctorsFailure(this.errMassage);
}

final class FavouriteDoctorsSuccess extends FavouriteDoctorsState {
  final List<DoctorEntity> favouriteDoctors;
  FavouriteDoctorsSuccess(this.favouriteDoctors);
}

final class AddFavouriteDoctorsSuccess extends FavouriteDoctorsState {
  
}