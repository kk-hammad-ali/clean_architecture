import 'package:clean_architecture/core/utils/colors.dart';
import 'package:clean_architecture/core/utils/dimension.dart';
import 'package:flutter/material.dart';

class CustomPasswordFeildWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool isVisiable;

  const CustomPasswordFeildWidget({
    Key? key,
    required this.controller,
    this.onEditingComplete,
    this.validator,
    this.textInputAction,
    this.isVisiable = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimensions dimensions = AppDimensions(context);
    return Container(
      width: double.infinity,
      height: dimensions.getScreenHeight * 0.1,
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
          obscuringCharacter: '*',
          textInputAction: textInputAction,
          onEditingComplete: onEditingComplete,
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          obscureText: true,
          focusNode: focusNode,
          decoration: InputDecoration(
            counterText: '',
            labelText: 'Password',
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColors.greyScale500Color,
            ),
            // suffixIcon: isVisiable,
            // ? IconButton(
            //     icon: Icon(
            //       isVisible ? Icons.visibility : Icons.visibility_off,
            //       color: isVisible
            //           ? AppColors.primaryColor
            //           : AppColors.greyScale500Color,
            //     ),
            //     onPressed: () {
            //       context.read<AuthBloc>().add(ShowHidePasswordEvent());
            //     },
            //   )
            // : const SizedBox(),
            contentPadding:
                EdgeInsets.only(top: dimensions.getScreenHeight * 0.005),
            border: InputBorder.none,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
