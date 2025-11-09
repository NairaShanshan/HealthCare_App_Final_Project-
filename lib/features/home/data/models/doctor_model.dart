// import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

// class DoctorModel extends DoctorEntity {
//   const DoctorModel({
//     required super.name,
//     required super.rating,
//     required super.specialization,
//     required super.image,
//     required super.price,
//   });

//   factory DoctorModel.fromJson(Map<String, dynamic> json) {
//     return DoctorModel(
//       name: json['name'] ?? '',
//       rating: (json['rating'] is int)
//           ? (json['rating'] as int).toDouble()
//           : (json['rating'] ?? 0.0),
//       specialization: json['specialization'] ?? '',
//       image: json['image'] ?? '',
//       price: (json['price'] is int)
//           ? (json['price'] as int).toDouble()
//           : (json['price'] ?? 0.0),
//     );
//   }

//   factory DoctorModel.fromEntity(DoctorEntity doctor) {
//     return DoctorModel(
//       name: doctor.name,
//       rating: doctor.rating,
//       specialization: doctor.specialization,
//       image: doctor.image,
//       price: doctor.price,
//     );
//   }

//   DoctorEntity toEntity() {
//     return DoctorEntity(
//       name: name,
//       rating: rating,
//       specialization: specialization,
//       image: image,
//       price: price,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'rating': rating,
//       'specialization': specialization,
//       'image': image,
//       'price': price,
//     };
//   }
// }
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.name,
    required super.rating,
    required super.specialization,
    required super.image,
    required super.price,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name']?.toString() ?? 'Unknown Doctor',
      rating: double.tryParse(json['rating']?.toString() ?? '0') ?? 0.0,
      specialization: json['specialization']?.toString() ?? 'General',
      image: json['image']?.toString() ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rating': rating.toString(),
      'specialization': specialization,
      'image': image,
      'price': price.toString(),
    };
  }

  factory DoctorModel.fromEntity(DoctorEntity doctor) {
    return DoctorModel(
      name: doctor.name,
      rating: doctor.rating,
      specialization: doctor.specialization,
      image: doctor.image,
      price: doctor.price,
    );
  }

  DoctorEntity toEntity() {
    return DoctorEntity(
      name: name,
      rating: rating,
      specialization: specialization,
      image: image,
      price: price,
    );
  }
}
