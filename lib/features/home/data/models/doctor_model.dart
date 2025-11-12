import 'package:healthcare_app/core/constants/doctors_images.dart';
import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel(
      {required super.name,
      required super.rating,
      required super.specialization,
      required super.id,
      required super.imagePath,
      required super.price});
  DoctorModel({
    required super.name,
    required super.rating,
    required super.specialization,
    required super.price,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json, String id) {
    return DoctorModel(
      name: json['name'],
      rating: json['rating'],
      specialization: json['specialization'],
      id: id,
      imagePath:
          json['imagePath'] == null || json['imagePath'].toString().isEmpty
              ? DoctorImages.getDoctorImage(id)
              : json['imagePath'],
      price: json['price'].toString(),
    );
        name: json['name'],
        rating: json['rating'],
        specialization: json['specialization'],
        price: json['price']);
  }

  factory DoctorModel.fromEntity(DoctorEntity doctor) {
    return DoctorModel(
      name: doctor.name,
      rating: doctor.rating,
      specialization: doctor.specialization,
      id: doctor.id,
      imagePath: doctor.imagePath,
      price: doctor.price,
    );
  }
  DoctorEntity toEntity() {
    return DoctorEntity(
      name: name,
      rating: rating,
      specialization: specialization,
      id: id,
      imagePath: imagePath,
      price: price,
    );
  }

  toMap() {
    return {
      'name': name,
      'rating': rating,
      'specialization': specialization,
      'id': id,
      'price': price,
    };
  }

  toList() {}
}
