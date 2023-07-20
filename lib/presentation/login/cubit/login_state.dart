part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.errorMessage = '',
  });

  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final String errorMessage;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Password? password,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() {
    return '''LoginState(status=$status,email=$email,password=$password,errorMessage=$errorMessage)''';
  }

  @override
  List<Object?> get props => [status, email, password, errorMessage];
}
