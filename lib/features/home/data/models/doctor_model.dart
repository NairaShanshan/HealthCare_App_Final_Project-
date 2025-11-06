import 'package:healthcare_app/features/home/domain/enitites/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.name,
    required super.rating,
    required super.specialization,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      rating: json['rating'],
      specialization: json['specialization'],
    );
  }

  factory DoctorModel.fromEntity(DoctorEntity doctor) {
    return DoctorModel(
      name: doctor.name,
      rating: doctor.rating,
      specialization: doctor.specialization,
    );
  }
  DoctorEntity toEntity() {
    return DoctorEntity(
      name: name,
      rating: rating,
      specialization: specialization,
    );
  }

  toMap() {
    return {
      'name': name,
      'rating': rating,
      'specialization': specialization,
    };
  }

  toList() {}
}
