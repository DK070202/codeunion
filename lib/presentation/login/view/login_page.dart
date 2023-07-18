import 'package:codeunion/app/config/config.dart';
import 'package:codeunion/app/router/router.dart';
import 'package:codeunion/components/components.dart';
import 'package:codeunion/presentation/login/cubit/login_cubit.dart';
import 'package:codeunion/presentation/login/view/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Авторизация'),
        ),
        body: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  void _onStateChange(
    BuildContext context,
    LoginState loginState,
  ) {
    switch (loginState.status) {
      case FormzSubmissionStatus.failure:
        showCupertinoDialog<void>(
          context: context,
          builder: (_) => AlertMessage(
            errorMessage: loginState.errorMessage,
            postDismiss: () {
              context.read<LoginBloc>().add(const ResetLoginValidation());
            },
          ),
        );

        return;

      case FormzSubmissionStatus.success:
        context.replace(AppRoutes.profile);
        return;

      case _:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current.errorMessage.isNotEmpty || current.status.isSuccess,
      listener: _onStateChange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.offWhite,
            ),
            child: Column(
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (currentState, upcomingState) =>
                      currentState.email != upcomingState.email,
                  builder: (context, state) => AppTextField(
                    key: const Key('Логин или почта'),
                    hint: 'Логин или почта',
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                            LoginEmailChanged(value),
                          );
                    },
                  ),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                  thickness: 0,
                  height: 1,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (currentState, upcomingState) =>
                      currentState.password != upcomingState.password,
                  builder: (context, state) => AppTextField(
                    key: const Key('Пароль'),
                    hint: 'Пароль',
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                            LoginPasswordChanged(value),
                          );
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 42,
            ),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return AppButton(
                  isLoading: state.status.isInProgress,
                  key: const Key('Зарегистрироваться'),
                  onPressed: () {
                    context.read<LoginBloc>().add(
                          const LoginSubmitted(),
                        );
                  },
                  label: 'Зарегистрироваться',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
