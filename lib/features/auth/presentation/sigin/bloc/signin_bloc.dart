import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/auth/domain/usecase/login_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final LoginUserUseCase _loginUserUseCase;

  SigninBloc({
    required LoginUserUseCase loginUserUseCase,
  })  : _loginUserUseCase = loginUserUseCase,
        super(SignInInitial()) {
    on<SignInButtonEvent>(_loginUser);
  }

  Future<void> _loginUser(
    SignInButtonEvent event,
    Emitter<SigninState> emit,
  ) async {
    print('pre');
    emit(const LoggingUserState());
    print('start');
    final result = await _loginUserUseCase.execute(
      email: event.email,
      password: event.password,
    );
    print('middle');
    result.fold(
      (failure) => emit(
          SignInErrorState(errorMessage: 'Error: ${failure.failureMessage}')),
      (_) => emit(
        const UserLoggedInState(),
      ),
    );
    print('end');
  }
}
