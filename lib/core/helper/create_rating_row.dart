import 'package:flutter/material.dart';

Row createRatingRow({
  required BuildContext context,
  required num rating,
}) {
  //4.5
  List<String> parts = rating.toString().split('.');
  String beforeDot = parts[0]; // "12"
  String afterDot = parts.length > 1 ? parts[1] : "0";
  int intPart = int.parse(beforeDot);
  int fractionPart = int.parse(afterDot);

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // full stars
      for (int i = 0; i < intPart; i++)
        const Icon(Icons.star, color: Colors.amber, size: 20),

      // half star if needed
      if (fractionPart >= 5)
        const Icon(Icons.star_half, color: Colors.amber, size: 20),
// 2.1 = 2
      // empty stars (to make total 5)
      for (int i = 0; i < 5 - intPart - (fractionPart >= 5 ? 1 : 0); i++)
        const Icon(Icons.star_border, color: Colors.amber, size: 20),
    ],
  );
}
