import 'package:clean_architecture/features/auth/presentation/sigin/component/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BodySignInScreen(),
    );
  }
}
