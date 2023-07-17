import 'package:codeunion/app/config/config.dart';
import 'package:codeunion/app/router/router.dart';
import 'package:codeunion/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.offWhite,
              ),
              child: Column(
                children: [
                  AppTextField(
                    hint: 'Логин или почта',
                  ),
                  Divider(
                    indent: 16,
                    endIndent: 16,
                    thickness: 0,
                    height: 1,
                  ),
                  AppTextField(
                    hint: 'Пароль',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.go(AppRoutes.profile);
                    },
                    child: const Text(
                      'Войти',
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Зарегистрироваться',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
