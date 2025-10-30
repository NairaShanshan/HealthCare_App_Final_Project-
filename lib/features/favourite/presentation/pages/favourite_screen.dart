import 'package:flutter/material.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';



import '../widgets/grit_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title:const  Text(
          'Favourite Doctors',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2/3.4,

            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const  GridContainerWidget(
                imagePath: AppImages.doctorOne,
                doctorName: 'Dr. Fillerup Grab ',
                specialty: 'Medicine Specialist',
              );
            }),
      ),
    );
  }
}
