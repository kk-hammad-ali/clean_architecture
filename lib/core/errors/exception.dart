import 'package:equatable/equatable.dart';

class AuthException extends Equatable implements Exception {
  final String errorMessage;
  final String? originalMessage;

  const AuthException(this.errorMessage, {this.originalMessage});

  @override
  List<Object?> get props => [errorMessage, originalMessage];
}
