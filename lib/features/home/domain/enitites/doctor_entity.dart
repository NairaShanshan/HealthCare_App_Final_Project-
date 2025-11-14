class DoctorEntity {
  final String name;
  final num rating;
  final String specialization;
  final String price;
  final String id;
  final String imagePath;

  const DoctorEntity({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.rating,
    required this.specialization,
    required this.price,
  });
}
