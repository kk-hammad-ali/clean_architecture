import 'package:clean_architecture/core/utils/colors.dart';
import 'package:clean_architecture/core/utils/dimension.dart';
import 'package:clean_architecture/features/auth/presentation/sigin/signin_screen.dart';
import 'package:clean_architecture/features/auth/presentation/signup/component/text_feilds_widget.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/custom_lower_column_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BodySignUpScreen extends StatelessWidget {
  const BodySignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimensions dimensions = AppDimensions(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: dimensions.getScreenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: dimensions.getScreenHeight * 0.05),
              Text(
                'Create your\nAccount',
                style: TextStyle(
                  fontSize: dimensions.getScreenWidth * 0.1,
                  color: AppColors.greyScale900Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: dimensions.getScreenHeight * 0.06),
              const TextFeildsWidgetSignUp(),
              SizedBox(height: dimensions.getScreenHeight * 0.01),
              Align(
                alignment: Alignment.center,
                child: CustomLowerColumnWidget(
                  lastText: "Signin",
                  descriptionText: "Already have an account? ",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // TODO: ADD THE ROUTE HRER
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
