part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignupState {}

class UserCreatingState extends SignupState {
  const UserCreatingState();
}

class UserCreatedState extends SignupState {
  const UserCreatedState();
}

class SignUpErrorState extends SignupState {
  const SignUpErrorState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
