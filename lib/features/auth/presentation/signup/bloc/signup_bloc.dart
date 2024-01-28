import 'package:clean_architecture/core/utils/routes.dart';
import 'package:clean_architecture/features/auth/domain/usecase/create_user_account_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final CreateUserAccountUseCase _createUserAccountUseCase;
  SignupBloc({
    required CreateUserAccountUseCase createUserAccountUseCase,
  })  : _createUserAccountUseCase = createUserAccountUseCase,
        super(SignUpInitial()) {
    on<SignUpButtonEvent>(
      (event, emit) async {
        emit(const UserCreatingState());

        final result = await _createUserAccountUseCase.execute(
          bio: event.bio,
          age: event.age,
          name: event.name,
          email: event.email,
          password: event.password,
        );
        result.fold(
            (l) => emit(SignUpErrorState('Error: ${l.failureMessage}')),
            (r) => emit(
                  const UserCreatedState(),
                ));
      },
    );

    on<NavigateToSignInScreenEvent>((event, emit) {
      Navigator.pushReplacementNamed(event.context, signInRoute);
    });
  }
}
