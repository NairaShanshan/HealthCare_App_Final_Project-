
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

// class DoctorModel extends DoctorEntity {
//   DoctorModel({
//     required super.name,
//     required super.rating,
//     required super.specialization,
//     required super.price,
//     required super.id,
//     required super.imagePath,
//   });

//   factory DoctorModel.fromJson(Map<String, dynamic> json, String id) {
//     return DoctorModel(
//       name: json['name'],
//       rating: json['rating'],
//       specialization: json['specialization'],
//       price: json['price'],
//       id: id,
//       imagePath:
//           json['imagePath'] == null || json['imagePath'].toString().isEmpty
//               ? DoctorImages.getDoctorImage(id)
//               : json['imagePath'],
//     );
//   }

//   factory DoctorModel.fromEntity(DoctorEntity doctor) {
//     return DoctorModel(
//         name: doctor.name,
//         rating: doctor.rating,
//         specialization: doctor.specialization,
//         price: doctor.price,
//         id: doctor.id,
//         imagePath: doctor.imagePath);
//   }
//   DoctorEntity toEntity() {
//     return DoctorEntity(
//       name: name,
//       rating: rating,
//       specialization: specialization,
//       price: price,
//       id: id,
//       imagePath: imagePath,
//     );
//   }

//   toMap() {
//     return {
//       'name': name,
//       'rating': rating,
//       'specialization': specialization,
//       'price': price,
//     };
//   }

//   toList() {}
// }
class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.name,
    required super.rating,
    required super.specialization,
    required super.price,
  });

  factory DoctorModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DoctorModel(
      name: json['name'],
      rating: json['rating'],
      specialization: json['specialization'],
      price: json['price'],
    );
  }

  factory DoctorModel.fromEntity(DoctorEntity doctor) {
    return DoctorModel(
      name: doctor.name,
      rating: doctor.rating,
      specialization: doctor.specialization,
      price: doctor.price,
    );
  }
  DoctorEntity toEntity() {
    return DoctorEntity(
      name: name,
      rating: rating,
      specialization: specialization,
      price: price,
    );
  }

  toMap() {
    return {
      'name': name,
      'rating': rating,
      'specialization': specialization,
      'price': price,
    };
  }

  toList() {}
}
