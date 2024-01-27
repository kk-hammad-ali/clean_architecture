import 'package:clean_architecture/core/utils/typedef.dart';

abstract class UserRepository {
  ResultFutureVoid loginUser({required String email, required String password});
  ResultFutureVoid createUserAccount({
    required String email,
    required String bio,
    required String name,
    required int age,
    required String password,
  });
}
