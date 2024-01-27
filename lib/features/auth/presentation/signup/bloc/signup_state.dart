part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignupState {}

class CreatingUserState extends SignupState {
  const CreatingUserState();
}

class UserCreatedState extends SignupState {
  const UserCreatedState();
}

class SignUpErrorState extends SignupState {
  const SignUpErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
