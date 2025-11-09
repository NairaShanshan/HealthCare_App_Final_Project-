// class DoctorEntity {
//   final String name;
//   final num rating;
//   final String specialization;
//   final String image;

//   final String price;

//   const DoctorEntity(
//     this.image, this.price, {
//     required this.name,
//     required this.rating,
//     required this.specialization,
//   });
// }
class DoctorEntity {
  final String name;
  final double rating;
  final String specialization;
  final String image;
  final double price;

  const DoctorEntity({
    required this.name,
    required this.rating,
    required this.specialization,
    required this.image,
    required this.price,
  });
}
