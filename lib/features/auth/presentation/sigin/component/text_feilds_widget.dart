import 'package:clean_architecture/core/utils/colors.dart';
import 'package:clean_architecture/core/utils/dimension.dart';
import 'package:clean_architecture/features/auth/presentation/sigin/bloc/signin_bloc.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/custom_long_button_widget.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/custom_password_textfields_widget.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/custom_textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFeildsWidgetSignIn extends StatefulWidget {
  const TextFeildsWidgetSignIn({
    super.key,
  });

  @override
  State<TextFeildsWidgetSignIn> createState() => _TextFeildsWidgetSignInState();
}

class _TextFeildsWidgetSignInState extends State<TextFeildsWidgetSignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<SigninBloc>(context).add(SignInButtonEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    AppDimensions dimensions = AppDimensions(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFieldWidget(
            isIcon: true,
            width: double.infinity,
            height: dimensions.getScreenHeight * 0.1,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            labelText: 'Enter your email',
            leadingIcon: const Icon(
              Icons.email,
              color: AppColors.greyScale500Color,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required.';
              }
              final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!regExp.hasMatch(value)) {
                return 'Please enter a valid email address.';
              }
              return null;
            },
          ),
          SizedBox(height: dimensions.getScreenHeight * 0.03),
          CustomPasswordFeildWidget(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            onEditingComplete: () {},
            validator: (value) {
              return null;
            },
            isVisiable: true,
          ),
          SizedBox(height: dimensions.getScreenHeight * 0.03),
          BlocBuilder<SigninBloc, SigninState>(
            builder: (context, state) {
              if (state is SignInErrorState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                });
              } else if (state is SignInLoadingState) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else if (state is SignInLoadedState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('User logged in successfully'),
                    ),
                  );
                });
              }
              return CustomLongButtonWidget(
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                text: 'SignIn',
                onPressed: () {
                  validateForm();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
