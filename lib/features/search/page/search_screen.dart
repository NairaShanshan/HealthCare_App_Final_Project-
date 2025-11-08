import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/services/doctor_services.dart';
import 'package:healthcare_app/core/widgets/main_text_form_field.dart';

import '../../../core/constants/app_images.dart';


import '../../home/presentation/widgets/detailed_doctor_card.dart';
// //
// // class SearchScreen extends StatelessWidget {
// //   const SearchScreen({super.key, required this.popularDoctor, required this.searchKey});
// //   final List<DoctorEntity> popularDoctor;
// //   final String searchKey;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title:const  Text('Find Doctors '),
// //         centerTitle: true,
// //       ),
// //       body: FutureBuilder(
// //         future: DoctorService.searchDoctorsByName(searchKey),
// //         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
// //           if (!snapshot.hasData) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //           return   Padding(
// //             padding: const EdgeInsets.all(20.0),
// //             child: Column(
// //               children: [
// //                 const MainTextFormField(hintText: 'Search.....',  textInputType: TextInputType.text),
// //                 const Gap(20) ,
// //                 Expanded(
// //                   child: ListView.separated(
// //                       itemBuilder: (context, index) {
// //                         final doc = snapshot.data!.docs[index];
// //                         return  DetailedDoctorCard(
// //                         doctorName: doc['name'],
// //                         specialty: doc['specialization'],
// //                         rating: doc['rating'],
// //                           imagePath: AppImages.doctorOne,
// //
// //                         );
// //                       },
// //                       separatorBuilder: (context ,index) => const Divider(),
// //                       itemCount: snapshot.data!.docs.length),
// //                 ) ,
// //
// //
// //               ],
// //             ),
// //           );
// //         } ,
// //
// //       ),
// //     );
// //   }
// // }
// //
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:healthcare_app/core/services/doctor_services.dart';
// import 'package:healthcare_app/core/widgets/main_text_form_field.dart';
//
// import '../../../core/constants/app_images.dart';
//
// import '../../home/domain/enitites/doctor_entity.dart';
// import '../../home/presentation/widgets/detailed_doctor_card.dart';
//
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key, required this.searchKey});
//
//   final String searchKey;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:const  Text('Find Doctors '),
//         centerTitle: true,
//       ),
//       body: FutureBuilder(
//         future: DoctorService.searchDoctorsByName(searchKey),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           return   Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 const MainTextFormField(hintText: 'Search.....',  textInputType: TextInputType.text),
//                 const Gap(20) ,
//                 Expanded(
//                   child: ListView.separated(
//                       itemBuilder: (context, index) {
//                         final doc = snapshot.data!.docs[index];
//                         return  DetailedDoctorCard(
//                           doctorName: doc['name'],
//                           specialty: doc['specialization'],
//                           rating: doc['rating'],
//                           imagePath: AppImages.doctorOne,
//
//                         );
//                       },
//                       separatorBuilder: (context ,index) => const Divider(),
//                       itemCount: snapshot.data!.docs.length),
//                 ) ,
//
//
//               ],
//             ),
//           );
//         } ,
//
//       ),
//     );
//   }
// }
//


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.searchKey});

  final String searchKey;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  late String _searchKey;
  late Future<QuerySnapshot> _searchFuture;

  @override
  void initState() {
    super.initState();
    _searchKey = widget.searchKey;
    _controller = TextEditingController(text: _searchKey);
    _searchFuture = DoctorService.searchDoctorsByName(_searchKey);
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchKey = value.trim(); // ✅ String فقط
      _searchFuture = DoctorService.searchDoctorsByName(_searchKey);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find Doctors'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            MainTextFormField(
              hintText: 'Search.....',
              textInputType: TextInputType.text,
              controller: _controller,
              onchange: _onSearchChanged,
            ),
            const Gap(20),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future: _searchFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No doctors found"));
                  }
                  return ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final doc = snapshot.data!.docs[index];
                      return DetailedDoctorCard(
                        doctorName: doc['name'],
                        specialty: doc['specialization'],
                        rating: doc['rating'],
                        imagePath: AppImages.doctorOne,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

