import 'package:clean_architecture/core/errors/exception.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/auth/data/data-source/user_data_source.dart';
import 'package:clean_architecture/features/auth/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImplementation extends UserRepository {
  final UserLocalDataSource _localDataSource;

  UserRepositoryImplementation(this._localDataSource);

  @override
  Future<Either<Failure, void>> createUserAccount({
    required String email,
    required String bio,
    required String name,
    required int age,
    required String password,
  }) async {
    try {
      await _localDataSource.createUserAccount(
        email: email,
        bio: bio,
        name: name,
        age: age,
        password: password,
      );
      return const Right(null);
    } on AuthException catch (e) {
      return Left(FirebaseFailure(
        failureMessage: e.errorMessage,
      ));
    } catch (_) {
      return const Left(
        FirebaseFailure(
          failureMessage: "Failed to create user account",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _localDataSource.loginUser(email, password);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(FirebaseFailure(failureMessage: e.errorMessage));
    } catch (_) {
      return const Left(
        FirebaseFailure(failureMessage: "Failed to log in"),
      );
    }
  }
}
