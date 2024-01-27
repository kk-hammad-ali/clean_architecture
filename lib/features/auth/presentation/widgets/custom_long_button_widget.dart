import 'package:clean_architecture/core/utils/colors.dart';
import 'package:clean_architecture/core/utils/dimension.dart';
import 'package:flutter/material.dart';

class CustomLongButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final void Function()? onPressed;
  const CustomLongButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    AppDimensions dimensions = AppDimensions(context);
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(dimensions.getScreenWidth * 0.5),
        child: ClipRRect(
          child: Container(
            width: double.infinity,
            height: dimensions.getScreenHeight * 0.075,
            padding: EdgeInsets.symmetric(
              horizontal: dimensions.getScreenWidth * 0.05,
            ),
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(dimensions.getScreenWidth * 0.5),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: dimensions.getScreenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
