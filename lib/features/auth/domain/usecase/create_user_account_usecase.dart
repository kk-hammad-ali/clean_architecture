import 'package:clean_architecture/core/utils/typedef.dart';
import 'package:clean_architecture/features/auth/domain/repository/user_repository.dart';

class CreateUserAccountUseCase {
  final UserRepository _userRepository;
  CreateUserAccountUseCase(this._userRepository);
  ResultFutureVoid execute({
    required String email,
    required String bio,
    required String name,
    required int age,
    required String password,
  }) {
    return _userRepository.createUserAccount(
      age: age,
      email: email,
      bio: bio,
      name: name,
      password: password,
    );
  }
}
