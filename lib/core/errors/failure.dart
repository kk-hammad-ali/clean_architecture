import 'package:clean_architecture/core/errors/exception.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String failureMessage;
  const Failure({
    required this.failureMessage,
  });

  @override
  List<Object?> get props => [failureMessage];
}

class FirebaseFailure extends Failure {
  const FirebaseFailure({required super.failureMessage});

  FirebaseFailure.fromException(AuthException exception)
      : this(
          failureMessage: exception.errorMessage,
        );
}
