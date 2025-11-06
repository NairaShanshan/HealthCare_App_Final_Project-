import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/functions.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.onSaved,
    this.isPassword = false,
    this.validator, this.borderColor, this.suffixIconColor, this.controller,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? suffixIconColor;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      onSaved: onSaved,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        prefixIcon: prefixIcon,
        enabledBorder: buildBorder(borderColor: borderColor ?? AppColors.borderColor),
        focusedBorder: buildBorder(borderColor: borderColor ?? AppColors.borderColor),
      ),
    );
  }
}
