import 'package:flutter/material.dart';
import 'package:healthcare_app/core/utils/app_colors.dart';

OutlineInputBorder buildBorder({Color borderColor = AppColors.borderColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      width: 1,
      color: borderColor,
    ),
  );
}
