import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/utils/routes.dart';
import 'package:clean_architecture/features/auth/domain/usecase/login_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final LoginUserUseCase _loginUserUseCase;

  SigninBloc({
    required LoginUserUseCase loginUserUseCase,
  })  : _loginUserUseCase = loginUserUseCase,
        super(SignInInitial()) {
    on<SignInButtonEvent>((event, emit) async {
      emit(const SignInLoadingState());
      final result = await _loginUserUseCase.execute(
        email: event.email,
        password: event.password,
      );
      result.fold(
        (l) => emit(SignInErrorState(errorMessage: l.failureMessage)),
        (r) => emit(const SignInLoadedState()),
      );
    });
    on<NavigateToSignUpScreenEvent>((event, emit) {
      Navigator.pushReplacementNamed(
        event.context,
        signUpRoute,
      );
    });
  }
}
