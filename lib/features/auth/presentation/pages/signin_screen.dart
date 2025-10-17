import 'package:flutter/material.dart';
import 'package:healthcare_app/features/auth/presentation/widgets/signin_screen_body.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SigninScreenBody(),
    );
  }
}
