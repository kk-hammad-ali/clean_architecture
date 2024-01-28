part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpButtonEvent extends SignupEvent {
  final String email;
  final String password;
  final String bio;
  final String name;
  final int age;

  const SignUpButtonEvent({
    required this.email,
    required this.password,
    required this.bio,
    required this.name,
    required this.age,
  });

  @override
  List<Object> get props => [email, password, bio, age, name];
}

class NavigateToSignInScreenEvent extends SignupEvent {
  final BuildContext context;
  const NavigateToSignInScreenEvent({required this.context});

  @override
  List<Object> get props => [];
}
