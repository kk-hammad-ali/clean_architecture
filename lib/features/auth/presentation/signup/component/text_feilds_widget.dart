import 'package:clean_architecture/core/utils/colors.dart';
import 'package:clean_architecture/core/utils/dimension.dart';
import 'package:clean_architecture/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/custom_long_button_widget.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/custom_password_textfields_widget.dart';
import 'package:clean_architecture/features/auth/presentation/widgets/custom_textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFeildsWidgetSignUp extends StatefulWidget {
  const TextFeildsWidgetSignUp({
    super.key,
  });

  @override
  State<TextFeildsWidgetSignUp> createState() => _TextFeildsWidgetSignUpState();
}

class _TextFeildsWidgetSignUpState extends State<TextFeildsWidgetSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: IMPLENT THE VALIDATE LOGIC
    } else {
      // TODO: IMPLENT THE INVALIDATE LOGIC
    }
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
            keyboardType: TextInputType.name,
            controller: _nameController,
            labelText: 'Enter name',
            leadingIcon: const Icon(
              Icons.person,
              color: AppColors.greyScale500Color,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is required.';
              }
              // Additional validation rules can be added here if needed
              return null;
            },
          ),
          SizedBox(height: dimensions.getScreenHeight * 0.02),
          CustomTextFieldWidget(
            isIcon: true,
            width: double.infinity,
            height: dimensions.getScreenHeight * 0.1,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: _bioController,
            labelText: 'Enter something about yourself',
            leadingIcon: const Icon(
              Icons.verified_user,
              color: AppColors.greyScale500Color,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Bio is required.';
              }
              // Additional validation rules can be added here if needed
              return null;
            },
          ),
          SizedBox(height: dimensions.getScreenHeight * 0.02),
          CustomTextFieldWidget(
            isIcon: true,
            width: double.infinity,
            height: dimensions.getScreenHeight * 0.1,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: _ageController,
            labelText: 'Enter your age',
            leadingIcon: const Icon(
              Icons.punch_clock,
              color: AppColors.greyScale500Color,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Age is required.';
              }
              final age = int.tryParse(value);
              if (age == null || age <= 0) {
                return 'Please enter a valid age.';
              }
              // Additional validation rules can be added here if needed
              return null;
            },
          ),
          SizedBox(height: dimensions.getScreenHeight * 0.02),
          CustomTextFieldWidget(
            isIcon: true,
            width: double.infinity,
            height: dimensions.getScreenHeight * 0.1,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            labelText: 'Enter your email',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required.';
              }
              final regExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Regular expression for email validation
              if (!regExp.hasMatch(value)) {
                return 'Please enter a valid email address.';
              }
              return null;
            },
            leadingIcon: const Icon(
              Icons.email,
              color: AppColors.greyScale500Color,
            ),
          ),
          SizedBox(height: dimensions.getScreenHeight * 0.02),
          CustomPasswordFeildWidget(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            onEditingComplete: () {},
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required.';
              }
              const passwordPattern =
                  r'^(?=.*?[A-Z])(?=.*?[!@#$&*])(?=.*?[0-9]).{8,}$';
              final regExp = RegExp(passwordPattern);
              if (!regExp.hasMatch(value)) {
                return 'Password must contain at least 8 characters including uppercase letters, numbers, and special characters.';
              }
              return null;
            },
            isVisiable: true,
          ),
          SizedBox(height: dimensions.getScreenHeight * 0.03),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              if (state is SignUpErrorState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                });
                return Container();
              } else if (state is UserCreatingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserCreatedState) {
                return const Center(
                  child: Text('Done'),
                );
              } else {
                // Show your default UI here
                return CustomLongButtonWidget(
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  text: 'SignUp',
                  onPressed: () {
                    context.read<SignupBloc>().add(
                          SignUpButtonEvent(
                            email: _emailController.text,
                            password: _passwordController.text,
                            age: 12,
                            bio: _bioController.text,
                            name: _nameController.text,
                          ),
                        );
                  },
                );
              }
            },
          ),
          CustomLongButtonWidget(
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
            text: 'SignUp',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
