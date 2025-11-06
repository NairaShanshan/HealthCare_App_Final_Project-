import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

enum DialogType { success, error, info }

showMyDialog(
    BuildContext context,
    String message, [
      DialogType type = DialogType.error,
    ]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: type == DialogType.error
          ? Colors.red
          : type == DialogType.success
          ? AppColors.primaryColor
          : AppColors.secondaryColor,
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) =>
        const Center(child: CircularProgressIndicator(),),
  );
}