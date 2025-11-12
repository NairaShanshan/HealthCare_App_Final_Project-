import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_app/core/cubit/favourite_doctors_cubit/favourite_doctors_state.dart';
import 'package:healthcare_app/features/home/domain/repository/doctors_repository.dart';

class FavouriteDoctorsCubit extends Cubit<FavouriteDoctorsState> {
  FavouriteDoctorsCubit(this.doctorsRepository)
      : super(FavouriteDoctorsInitial());
  final DoctorsRepository doctorsRepository;

  Future<void> getFavouriteDoctors() async {
    emit(FavouriteDoctorsLoading());
    final result = await doctorsRepository.getFavouriteDoctor();
    print('$result');
    result.fold(
      (failure) {
        print('failure in Fav cubit');
        if (!isClosed) {
          emit(FavouriteDoctorsFailure(failure.message));
        }
      },
      (doctors) {
        print('success in Fav cubit');
        if (!isClosed) {
          emit(FavouriteDoctorsSuccess(doctors));
        }
      },
    );
  }

  Future<void> addFavouriteDoctors({
    required Map<String, dynamic> data,
  }) async {
    emit(AddFavouriteDoctorsLoading());

    final result = await doctorsRepository.addFavouriteDoctor(
      data: data,
      docId: data['name'],
    );
    result.fold(
      (failure) {
        print('failure in Fav cubit');
        if (!isClosed) {
          emit(AddFavouriteDoctorsFailure(failure.message));
        }
      },
      (success) {
        print('success in Fav cubit');
        if (!isClosed) {
          emit(AddFavouriteDoctorsSuccess());
        }
      },
    );
  }

  // bool checkIfDataExists({required String id}) {
  //   bool isExist = false;
  //   doctorsRepository.checkIfDataExists(id: id).then((value) {
  //     isExist = value;
  //   });
  //   return isExist;
  // }
  Stream<bool> isDoctorFavouriteStream(String docId) {
    return doctorsRepository.isDoctorFavouriteStream(docId);
  }

  Future<bool> checkIfDataExists({required String id}) async {
    return await doctorsRepository.checkIfDataExists(
      id: id,
    );
  }

  Future<void> removeFromFavourites(String doctorId) async {
    await doctorsRepository.removeFromFavourites(id: doctorId);
  }
}
