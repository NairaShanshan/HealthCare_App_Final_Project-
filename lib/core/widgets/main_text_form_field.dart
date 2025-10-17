import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.onSaved,
    this.isPassword = false,
    this.validator,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final bool isPassword;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      onSaved: onSaved,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: prefixIcon,
        ),
      ),
    );
  }
}
