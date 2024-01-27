import 'package:clean_architecture/features/auth/data/data-source/user_data_source.dart';
import 'package:clean_architecture/features/auth/data/repo-impl/user_repository_implementation.dart';
import 'package:clean_architecture/features/auth/domain/repository/user_repository.dart';
import 'package:clean_architecture/features/auth/domain/usecase/create_user_account_usecase.dart';
import 'package:clean_architecture/features/auth/domain/usecase/login_user_usecase.dart';
import 'package:clean_architecture/features/auth/presentation/sigin/bloc/signin_bloc.dart';
import 'package:clean_architecture/features/auth/presentation/signup/bloc/signup_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

final createUserAccountUseCase = locator<CreateUserAccountUseCase>();

final loginUserUseCase = locator<LoginUserUseCase>();

void setupLocator() {
  //bloc
  locator.registerFactory(() => SigninBloc(loginUserUseCase: locator()));
  locator
      .registerFactory(() => SignupBloc(createUserAccountUseCase: locator()));

  // Register FirebaseAuth and FirebaseFirestore
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  // Register data sources
  locator.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImplementation(
            locator<FirebaseAuth>(),
            locator<FirebaseFirestore>(),
          ));
  // Register repositories
  locator
      .registerLazySingleton<UserRepository>(() => UserRepositoryImplementation(
            locator<UserLocalDataSource>(),
          ));

  // Register use cases
  locator.registerLazySingleton<CreateUserAccountUseCase>(
      () => CreateUserAccountUseCase(
            locator<UserRepository>(),
          ));

  locator.registerLazySingleton<LoginUserUseCase>(
    () => LoginUserUseCase(
      locator<UserRepository>(),
    ),
  );
}
