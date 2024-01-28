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
    //consider this patter to emit states
    on<SignInButtonEvent>((event, emit) async {
      emit(const SignInLoadingState());
      final result = await _loginUserUseCase.execute(email: event.email, password: event.password);
      result.fold(
        (l) => emit(SignInErrorState(errorMessage: l.failureMessage)),
        (r) => emit(const SignInLoadedState()),
      );
    });
  }
}
