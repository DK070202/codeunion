import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

enum EmailValidationError {
  empty("Email can't be empty"),
  notValidFormat('Provided email is not in valid format');

  const EmailValidationError(this.message);
  final String message;

  @override
  String toString() => message;
}

class Email extends FormzInput<String, EmailValidationError>
    with EquatableMixin {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;

    final regEx = RegExp(
      "([!#-'*+/-9=?A-Z^-~-]+(.[!#-'*+/-9=?A-Z^-~-]+)*|\"([]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(.[!#-'*+/-9=?A-Z^-~-]+)*|[[\t -Z^-~]*])",
    );

    final hasMatch = regEx.hasMatch(value);

    if (!hasMatch) return EmailValidationError.notValidFormat;

    return null;
  }

  @override
  List<Object?> get props => [value];
}
