import 'package:clean_architecture/core/utils/typedef.dart';
import 'package:clean_architecture/features/auth/domain/repository/user_repository.dart';

class LoginUserUseCase {
  final UserRepository _userRepository;
  LoginUserUseCase(this._userRepository);
  ResultFutureVoid execute({
    required String email,
    required String password,
  }) {
    return _userRepository.loginUser(
      email: email,
      password: password,
    );
  }
}
