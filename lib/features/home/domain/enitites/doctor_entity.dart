class DoctorEntity {
  final String id;
  final String name;
  final num rating;
  final String specialization;
  final String imagePath;

  const DoctorEntity(
      {required this.id,
      required this.name,
      required this.rating,
      required this.specialization,
      required this.imagePath});
}
