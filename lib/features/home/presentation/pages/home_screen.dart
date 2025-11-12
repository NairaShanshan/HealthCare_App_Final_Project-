import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_app/core/cubit/favourite_doctors_cubit/favourite_doctors_cubit.dart';
import 'package:healthcare_app/core/services/get_it_service.dart';
import 'package:healthcare_app/features/home/domain/repository/doctors_repository.dart';
import 'package:healthcare_app/features/home/presentation/cubits/popular_doctors_cubit/popular_doctors_cubit.dart';

import 'package:healthcare_app/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   context.read<FavouriteDoctorsCubit>().getFavouriteDoctors();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            PopularDoctorsCubit(getIt.get<DoctorsRepository>()),
        child: const HomeScreenBody(),
      ),
    );
  }
}
