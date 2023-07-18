import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty(
    "Password can't be empty",
  ),
  shortPassword(
    'For security purposes, your password must be at least 6 characters long',
  );

  const PasswordValidationError(this.message);
  final String message;

  @override
  String toString() => message;
}

class Password extends FormzInput<String, PasswordValidationError>
    with EquatableMixin {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;

    if (value.length < 6) return PasswordValidationError.shortPassword;

    return null;
  }

  @override
  List<Object?> get props => [value];
}
