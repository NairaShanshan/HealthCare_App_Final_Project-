import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/services/doctor_services.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';

import '../../../core/constants/app_images.dart';
import '../../home/presentation/widgets/detailed_doctor_card.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key, required this.searchKey});

  final String searchKey;

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DoctorService.searchDoctorsByName(widget.searchKey),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const  Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
        }
        return snapshot.data!.docs.isEmpty
            ? const Center(child: Text("No doctors found"))
            : ListView.separated(
                itemBuilder: (context, index) {
                  final doc = snapshot.data!.docs[index];

                  return DetailedDoctorCard(
                    doctorName: doc['name'],
                    specialty: doc['specialization'],
                    rating: doc['rating'],
                    imagePath: AppImages.doctorOne,
                  );
                },
                separatorBuilder: (context ,index ) => const Gap(10),
                itemCount: snapshot.data!.docs.length);
      },
    );
  }
}
