part of 'signin_bloc.dart';

sealed class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SigninState {}

class SignInLoadedState extends SigninState {
  const SignInLoadedState();
}

class SignInLoadingState extends SigninState {
  const SignInLoadingState();
}

class SignInErrorState extends SigninState {
  const SignInErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
