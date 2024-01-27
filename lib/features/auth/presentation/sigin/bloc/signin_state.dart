part of 'signin_bloc.dart';

sealed class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SigninState {}

class LoggingUserState extends SigninState {
  const LoggingUserState();
}

class UserLoggedInState extends SigninState {
  const UserLoggedInState();
}

class SignInErrorState extends SigninState {
  const SignInErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
