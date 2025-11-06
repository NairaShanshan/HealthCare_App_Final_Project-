import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_app/features/home/presentation/cubits/popular_doctors_cubit/popular_doctors_cubit.dart';
import 'package:healthcare_app/features/home/presentation/cubits/popular_doctors_cubit/popular_doctors_state.dart';
import 'package:healthcare_app/features/home/presentation/widgets/popular_doctors_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularDoctorsViewBlocBuilder extends StatelessWidget {
  const PopularDoctorsViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularDoctorsCubit, PopularDoctorsState>(
      builder: (context, state) {
        if (state is PopularDoctorsSuccess) {
          return PopularDoctorsView(
            doctors: state.popularDoctors,
          );
        } else if (state is PopularDoctorsFailure) {
          return Container(
            color: Colors.red,
          );
        } else {
          return const Skeletonizer(
            enabled: true,
            child: PopularDoctorsView(doctors: []),
          );
        }
      },
    );
  }
}
