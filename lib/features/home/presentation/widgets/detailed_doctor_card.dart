// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:healthcare_app/core/constants/app_images.dart';
// import 'package:healthcare_app/core/helper/create_rating_row.dart';
// import 'package:healthcare_app/core/routes/navigation.dart';
// import 'package:healthcare_app/core/routes/routes.dart';
// import 'package:healthcare_app/core/utils/app_colors.dart';
// import 'package:healthcare_app/core/widgets/main_button.dart';
// import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

// class DetailedDoctorCard extends StatelessWidget {
//   final String imagePath;
//   final String doctorName;
//   final String specialty;
//   final double rating;

//   const DetailedDoctorCard({
//     super.key,
//     required this.imagePath,
//     required this.doctorName,
//     required this.specialty,
//     required this.rating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: AppColors.backgroundColor,
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: AppColors.greyColor.withValues(alpha: .2)),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             child: Image.asset(
//               imagePath,
//               width: 70,
//               height: 70,
//               fit: BoxFit.cover,
//               errorBuilder: (_, __, ___) => Image.asset(AppImages.doc7),
//             ),
//           ),

//           const SizedBox(width: 8),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   doctorName,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   specialty,
//                   style: const TextStyle(
//                     fontSize: 13,
//                     color: AppColors.greyColor,
//                   ),
//                 ),
//                 const Gap(5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: createRatingRow(
//                         context: context,
//                         rating: rating,
//                       ),
//                     ),

//                     // Text.rich(
//                     //   textAlign: TextAlign.right,
//                     //   TextSpan(children: [
//                     //     TextSpan(
//                     //       text: '$rating',
//                     //       style: const TextStyle(
//                     //         fontWeight: FontWeight.w500,
//                     //         fontSize: 16,
//                     //         color: Colors.black,
//                     //       ),
//                     //     ),
//                     //     const TextSpan(
//                     //       text: '(2475views)',
//                     //       style: TextStyle(
//                     //         fontWeight: FontWeight.w400,
//                     //         fontSize: 14,
//                     //         color: AppColors.greyColor,
//                     //       ),
//                     //     ),
//                     //   ]),
//                     // )
//                   ],
//                 ),
//                 const Gap(10),
//                 MainButton(
//                     borderRadius: BorderRadius.circular(3),
//                     width: 150,
//                     height: 33,
//                     text: 'Book Now',
//                     onPressed: () {
//                       pushTo(
//                         context: context,
//                         path: Routes.doctor,
//                         extra: {
//                           'doctor': DoctorEntity(
//                             name: doctorName,
//                             specialization: specialty,
//                             rating: rating,
//                             image: imagePath,
//                             price: 0.0,
//                             id: '',
//                           )
//                         },
//                       );
//                     })
//               ],
//             ),
//           ),

//           // 🔖 BOOKMARK ICON
//           GestureDetector(
//             onTap: () {},
//             child: const Icon(
//               Icons.favorite,
//               color: AppColors.primaryColor,
//               size: 24,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/constants/app_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:healthcare_app/core/helper/create_rating_row.dart';
import 'package:healthcare_app/core/routes/navigation.dart';
import 'package:healthcare_app/core/routes/routes.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';
import 'package:healthcare_app/core/widgets/main_button.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/features/home/data/models/doctor_model.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';
import 'package:healthcare_app/core/cubit/favourite_doctors_cubit/favourite_doctors_cubit.dart';

class DetailedDoctorCard extends StatefulWidget {
  final String imagePath;
  final String doctorName;
  final String specialty;
  final double rating;
  final DoctorEntity doctorEntity;

  const DetailedDoctorCard({
    super.key,
    required this.imagePath,
    required this.doctorEntity,
  });

  @override
  State<DetailedDoctorCard> createState() => _DetailedDoctorCardState();
}

class _DetailedDoctorCardState extends State<DetailedDoctorCard> {
  late FavouriteDoctorsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<FavouriteDoctorsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.greyColor.withValues(alpha: .2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ Doctor image
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              widget.imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.asset(AppImages.doc7),
            ),
          ),
          const SizedBox(width: 8),

          // 📄 Doctor info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctorEntity.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.doctorEntity.specialization,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.greyColor,
                  ),
                ),
                const Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: createRatingRow(
                        context: context,
                        rating: rating,
                      ),
                    createRatingRow(
                      context: context,
                      rating: widget.doctorEntity.rating,
                    ),
                  ],
                ),
                const Gap(10),
                MainButton(
                  borderRadius: BorderRadius.circular(3),
                  width: 150,
                  height: 33,
                  text: 'Book Now',
                  onPressed: () {
                    pushTo(
                      context: context,
                      path: Routes.doctor,
                      extra: {
                        'doctor': DoctorEntity(
                          name: doctorName,
                          specialization: specialty,
                          rating: rating,
                          imagePath: imagePath,
                          price: "",
                          id: '',
                        )
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.favorite,
              color: AppColors.primaryColor,
              size: 24,
            ),
                      path: Routes.doctorScreen,
                    );
                  },
                ),
              ],
            ),
          ),

          StreamBuilder<bool>(
            stream: cubit.isDoctorFavouriteStream(widget.doctorEntity.name),
            builder: (context, snapshot) {
              final isFavourite = snapshot.data ?? false;

              return GestureDetector(
                onTap: () async {
                  if (isFavourite) {
                    await cubit.removeFromFavourites(widget.doctorEntity.name);
                  } else {
                    await cubit.addFavouriteDoctors(
                      data: DoctorModel.fromEntity(widget.doctorEntity).toMap(),
                    );
                  }
                },
                child: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
