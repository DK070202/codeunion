import 'package:bloc_test/bloc_test.dart';
import 'package:codeunion/domain/auth/entity/login_response.dart';
import 'package:codeunion/domain/auth/entity/token.dart';
import 'package:codeunion/domain/auth/repository/auth_repo.dart';
import 'package:codeunion/domain/user/entity/user_entity.dart';
import 'package:codeunion/presentation/login/cubit/login_bloc.dart';
import 'package:codeunion/presentation/login/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_block_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  final mock = MockAuthRepository();

  when(mock.login('dhruvin.vainsh02@gmail.com', 'dhruvin')).thenAnswer(
    (i) async => const LoginResponseEntity(
      user: UserEntity(
        id: '1',
        nicName: 'Dk',
        email: 'dhruvin.vainsh02@gmail.com',
      ),
      tokens: TokensEntity(
        refreshToken: 'random-token-value',
        accessToken: 'random-token-value',
      ),
    ),
  );

  group('LoginBloc', () {
    test('initial state of forma should [FormzSubmissionStatus.initial]', () {
      expect(LoginBloc(authRepository: mock).state, const LoginState());
    });

    blocTest<LoginBloc, LoginState>(
      'email filed of LoginState should be dirty',
      build: () => LoginBloc(authRepository: mock),
      act: (cubit) => cubit.add(
        const LoginEmailChanged('dhruvin.vainsh02@gmail.com'),
      ),
      expect: () => [
        equals(
          const LoginState(
            email: Email.dirty('dhruvin.vainsh02@gmail.com'),
          ),
        )
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'password filed of LoginState should be dirty',
      build: () => LoginBloc(authRepository: mock),
      act: (cubit) => cubit.add(
        const LoginPasswordChanged('randomPassword@1234'),
      ),
      expect: () => [
        equals(
          const LoginState(
            password: Password.dirty('randomPassword@1234'),
          ),
        )
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should provide empty email error',
      build: () => LoginBloc(authRepository: mock),
      act: (cubit) => cubit.add(
        const LoginSubmitted(),
      ),
      expect: () => [
        equals(
          LoginState(
            status: FormzSubmissionStatus.failure,
            errorMessage: EmailValidationError.empty.message,
          ),
        )
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should provide invalid email error',
      build: () => LoginBloc(authRepository: mock),
      act: (cubit) {
        cubit
          ..add(
            const LoginEmailChanged(
              'Dhruvin',
            ),
          )
          ..add(
            const LoginSubmitted(),
          );
      },
      expect: () => [
        equals(
          const LoginState(
            email: Email.dirty('Dhruvin'),
          ),
        ),
        equals(
          LoginState(
            status: FormzSubmissionStatus.failure,
            errorMessage: EmailValidationError.notValidFormat.message,
            email: const Email.dirty('Dhruvin'),
          ),
        )
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should provide empty password error',
      build: () => LoginBloc(authRepository: mock),
      act: (cubit) {
        cubit
          ..add(
            const LoginEmailChanged(
              'dhruvin.vainsh02@gmail.com',
            ),
          )
          ..add(
            const LoginSubmitted(),
          );
      },
      expect: () => [
        equals(
          const LoginState(
            email: Email.dirty('dhruvin.vainsh02@gmail.com'),
          ),
        ),
        equals(
          LoginState(
            status: FormzSubmissionStatus.failure,
            errorMessage: PasswordValidationError.empty.message,
            email: const Email.dirty('dhruvin.vainsh02@gmail.com'),
          ),
        )
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should provide invalid password error',
      build: () => LoginBloc(authRepository: mock),
      act: (cubit) {
        cubit
          ..add(
            const LoginEmailChanged(
              'dhruvin.vainsh02@gmail.com',
            ),
          )
          ..add(
            const LoginPasswordChanged(
              'dhr',
            ),
          )
          ..add(
            const LoginSubmitted(),
          );
      },
      expect: () => [
        equals(
          const LoginState(
            email: Email.dirty('dhruvin.vainsh02@gmail.com'),
          ),
        ),
        equals(
          const LoginState(
            email: Email.dirty('dhruvin.vainsh02@gmail.com'),
            password: Password.dirty('dhr'),
          ),
        ),
        equals(
          LoginState(
            status: FormzSubmissionStatus.failure,
            errorMessage: PasswordValidationError.shortPassword.message,
            email: const Email.dirty('dhruvin.vainsh02@gmail.com'),
            password: const Password.dirty('dhr'),
          ),
        )
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should update status FormzSubmissionStatus.success',
      build: () => LoginBloc(authRepository: mock),
      wait: const Duration(seconds: 2),
      act: (cubit) {
        cubit
          ..add(
            const LoginEmailChanged(
              'dhruvin.vainsh02@gmail.com',
            ),
          )
          ..add(
            const LoginPasswordChanged(
              'dhruvin',
            ),
          )
          ..add(
            const LoginSubmitted(),
          );
      },
      expect: () => [
        equals(
          const LoginState(
            email: Email.dirty('dhruvin.vainsh02@gmail.com'),
          ),
        ),
        equals(
          const LoginState(
            email: Email.dirty('dhruvin.vainsh02@gmail.com'),
            password: Password.dirty('dhruvin'),
          ),
        ),
        equals(
          const LoginState(
            status: FormzSubmissionStatus.inProgress,
            email: Email.dirty('dhruvin.vainsh02@gmail.com'),
            password: Password.dirty('dhruvin'),
          ),
        ),
        equals(
          const LoginState(
            status: FormzSubmissionStatus.success,
            email: Email.dirty('dhruvin.vainsh02@gmail.com'),
            password: Password.dirty('dhruvin'),
          ),
        ),
      ],
    );
  });
}
