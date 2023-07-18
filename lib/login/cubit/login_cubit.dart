import 'package:codeunion/login/model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_passwordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<ResetLoginValidation>(_onResetValidation);
  }

  /// Validates the email.
  ///
  /// On each user input mutates the current state field [LoginState.password]
  /// from  [loginEmailChanged].
  void _onEmailChanged(
    LoginEmailChanged loginEmailChanged,
    Emitter<LoginState> emitter,
  ) {
    final email = Email.dirty(loginEmailChanged.email);
    emitter(
      state.copyWith(
        email: email,
      ),
    );
  }

  /// Validates the password.
  ///
  /// On each user input mutates the current state field  [LoginState.email]
  /// from [loginPasswordChanged].
  void _passwordChanged(
    LoginPasswordChanged loginPasswordChanged,
    Emitter<LoginState> emitter,
  ) {
    final password = Password.dirty(loginPasswordChanged.password);
    emitter(
      state.copyWith(
        password: password,
      ),
    );
  }

  /// Resets the validation.
  ///
  /// Mutates the state as such that reverts the submission of the form.
  void _onResetValidation(
    ResetLoginValidation onResetValidation,
    Emitter<LoginState> emitter,
  ) {
    emitter(
      state.copyWith(
        errorMessage: '',
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  /// Validates the current forms.
  ///
  /// Validates the current form values [LoginState.email] and
  /// [LoginState.password] on submission.
  Future<void> _onSubmitted(
    LoginSubmitted onSubmitted,
    Emitter<LoginState> emitter,
  ) async {
    final forms = <FormzInput<Object, Object>>[state.email, state.password];

    final isValid = Formz.validate(forms);

    if (!isValid) {
      final invalidForms = forms.where((element) => element.error != null);
      assert(
        invalidForms.isNotEmpty,
        '''
In case invalid form data there should be one or more formz filed
         should contain message''',
      );
      final message = invalidForms.first.error.toString();

      emitter(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: message,
        ),
      );

      return;
    }

    if (isValid) {
      emitter(
        state.copyWith(status: FormzSubmissionStatus.inProgress),
      );

      try {
        // ignore: inference_failure_on_instance_creation
        await Future.delayed(const Duration(seconds: 2));
        emitter(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        emitter(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
