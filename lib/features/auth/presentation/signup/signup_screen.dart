import 'package:clean_architecture/core/utils/colors.dart';
import 'package:clean_architecture/features/auth/presentation/signup/component/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BodySignUpScreen(),
    );
  }
}
