import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/cubit/favourite_doctors_cubit/favourite_doctors_cubit.dart';
import 'package:healthcare_app/core/cubit/favourite_doctors_cubit/favourite_doctors_state.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/utils/text_styles.dart';

import '../widgets/grit_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteDoctorsCubit>().getFavouriteDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: const Text(
          'Favourite Doctors',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<FavouriteDoctorsCubit, FavouriteDoctorsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FavouriteDoctorsSuccess) {
                final list = state.favouriteDoctors;
                if (list.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.noFavouriteImage, height: 150),
                        const SizedBox(height: 20),
                        const Text(
                          "You haven't added any favourite doctors yet",
                          textAlign: TextAlign.center,
                          style: TextStyles.textStyles15,
                        ),
                      ],
                    ),
                  );
                }
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3.4,
                    ),
                    itemCount: state.favouriteDoctors.length,
                    itemBuilder: (context, index) {
                      return GridContainerWidget(
                        imagePath: AppImages.doctorOne,
                        doctorName: state.favouriteDoctors[index].name,
                        specialty: state.favouriteDoctors[index].specialization,
                      );
                    });
              } else if (state is FavouriteDoctorsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  color: AppColors.errorColor,
                );
              }
            }),
      ),
    );
  }
}
