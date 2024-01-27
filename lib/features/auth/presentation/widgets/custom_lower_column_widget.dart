import 'package:clean_architecture/core/utils/colors.dart';
import 'package:clean_architecture/core/utils/dimension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomLowerColumnWidget extends StatelessWidget {
  final GestureRecognizer? recognizer;
  final String descriptionText;
  final String lastText;
  const CustomLowerColumnWidget({
    super.key,
    this.recognizer,
    required this.lastText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    AppDimensions dimensions = AppDimensions(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            // ADD THE ROUTE HERE
          },
          child: Text(
            'Forget the password?',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: dimensions.getScreenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: dimensions.getScreenHeight * 0.02),
        Text.rich(
          TextSpan(
            text: descriptionText,
            style: TextStyle(
              color: AppColors.greyScale500Color,
              fontSize: dimensions.getScreenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: lastText,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: dimensions.getScreenWidth * 0.045,
                ),
                recognizer: recognizer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
