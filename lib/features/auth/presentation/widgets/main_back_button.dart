import 'package:flutter/material.dart';
import 'package:healthcare_app/core/routes/navigation.dart';

class MainBackButton extends StatelessWidget {
  const MainBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            pop(context);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xffe8ecf4), // light gray border
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
