class DoctorEntity {
  final String id;
  final String name;
  final num rating;
  final String specialization;
  final String imagePath;
  final String price;

  const DoctorEntity(
      {required this.id,
      required this.name,
      required this.rating,
      required this.specialization,
      required this.imagePath,
      required this.price});
}
