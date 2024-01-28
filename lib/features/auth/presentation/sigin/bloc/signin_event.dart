part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

class SignInButtonEvent extends SigninEvent {
  final String email;
  final String password;

  const SignInButtonEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class NavigateToSignUpScreenEvent extends SigninEvent {
  final BuildContext context;
  const NavigateToSignUpScreenEvent({required this.context});

  @override
  List<Object> get props => [];
}
