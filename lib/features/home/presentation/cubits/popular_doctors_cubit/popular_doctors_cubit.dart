import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_app/features/home/domain/repository/doctors_repository.dart';
import 'package:healthcare_app/features/home/presentation/cubits/popular_doctors_cubit/popular_doctors_state.dart';

class PopularDoctorsCubit extends Cubit<PopularDoctorsState> {
  PopularDoctorsCubit(this.doctorsRepository) : super(PopularDoctorsInitial());
  final DoctorsRepository doctorsRepository;

  Future<void> getPopularDoctors() async {
    emit(PopularDoctorsLoading());
    final result = await doctorsRepository.getPopularDoctor();
    print('$result');
    result.fold(
      (failure) {
        print('failure in cubit');
        if (!isClosed) {
          emit(PopularDoctorsFailure(failure.message));
        }
      },
      (doctors) {
        print('success in cubit');
        if (!isClosed) {
          emit(PopularDoctorsSuccess(doctors));
        }
      },
    );
  }
}
