import 'package:clean_architecture/core/utils/colors.dart';
import 'package:clean_architecture/core/utils/dimension.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final Widget? leadingIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final double? width;
  final double? height;
  final int? totalLength;
  final bool isIcon;
  final TextAlign textAlign;
  final bool? obscureText;
  final bool? priceText;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    this.labelText,
    this.leadingIcon,
    required this.validator,
    required this.keyboardType,
    this.onEditingComplete,
    required this.textInputAction,
    required this.width,
    required this.height,
    this.isIcon = false,
    this.focusNode,
    this.totalLength,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.priceText = false,
  });

  @override
  Widget build(BuildContext context) {
    AppDimensions dimensions = AppDimensions(context);
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      padding:
          EdgeInsets.symmetric(horizontal: dimensions.getScreenWidth * 0.05),
      decoration: ShapeDecoration(
        color: AppColors.greyScale50Color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dimensions.getScreenWidth * 0.04),
        ),
      ),
      child: Center(
        child: TextFormField(
          style: TextStyle(
            fontSize: obscureText! || priceText!
                ? dimensions.getScreenWidth * 0.06
                : dimensions.getScreenWidth * 0.04,
          ),
          cursorHeight: dimensions.getScreenWidth * 0.05,
          obscuringCharacter: "*",
          maxLength: totalLength,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText!,
          textAlign: textAlign,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            counterText: '',
            labelText: labelText,
            prefixIcon: isIcon ? leadingIcon : null,
            border: InputBorder.none,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
