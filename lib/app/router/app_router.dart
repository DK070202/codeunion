import 'dart:developer' as dev;

import 'package:codeunion/app/router/router.dart';
import 'package:codeunion/domain/auth/repository/auth_repo.dart';
import 'package:codeunion/presentation/home/home.dart';
import 'package:codeunion/presentation/login/login.dart';
import 'package:codeunion/presentation/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

/// Holds all router configuration for app.
final class AppRouter {
  const AppRouter._();

  static final _shellRouterKey = GlobalKey<NavigatorState>(
    debugLabel: 'Shell router key',
  );

  static final _rootKey = GlobalKey<NavigatorState>(
    debugLabel: 'Main router key',
  );

  static final router = GoRouter(
    initialLocation: GetIt.I<AuthRepository>().isAuthenticated()
        ? AppRoutes.map
        : AppRoutes.tape,
    navigatorKey: _rootKey,
    routes: [
      ShellRoute(
        parentNavigatorKey: _rootKey,
        navigatorKey: _shellRouterKey,
        builder: (context, state, child) => HomePage(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.tape,
            pageBuilder: (context, state) => NoTransitionPage(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Лента'),
                ),
                body: Center(
                  child: OutlinedButton(
                    onPressed: () {
                      context.push(AppRoutes.test);
                    },
                    child: const Text('Navigate'),
                  ),
                ),
              ),
            ),
          ),
          GoRoute(
            path: AppRoutes.map,
            pageBuilder: (ctx, state) => NoTransitionPage(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Карта'),
                ),
              ),
            ),
          ),
          GoRoute(
            path: AppRoutes.selected,
            pageBuilder: (ctx, state) => NoTransitionPage(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Избранные'),
                ),
              ),
            ),
          ),
          GoRoute(
            path: AppRoutes.profile,
            pageBuilder: (ctx, state) => const NoTransitionPage(
              child: ProfilePage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.test,
        builder: (ctx, state) => WillPopScope(
          onWillPop: () {
            print('Pop called on the test page');
            return Future.value(false);
          },
          child: const Scaffold(
            body: Center(
              child: Text('Test page'),
            ),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (ctx, state) => const LoginPage(),
      ),
    ],
    redirect: (context, state) {
      dev.log(state.toStringDebugString());

      final isAuthenticated = GetIt.I<AuthRepository>().isAuthenticated();
      if (isAuthenticated) {
        return null;
      }

      if (!isAuthenticated && state.matchedLocation != AppRoutes.login) {
        final encoded = Uri.parse(state.location).toString();
        return '${AppRoutes.login}?redirectTo=$encoded';
      }

      return null;
    },
  );
}

extension on GoRouterState {
  // ignore: unused_element
  String toStringDebugString() {
    final stringBuffer = StringBuffer()
      ..writeln('GoRouterState(')
      ..writeln('location: $location')
      ..writeln('matchedLocation:$matchedLocation')
      ..writeln('name: $name')
      ..writeln('path: $path')
      ..writeln('fullPath: $fullPath')
      ..writeln('fullPath: $pathParameters')
      ..writeln('fullPath: $queryParameters')
      ..writeln('fullPath: $queryParametersAll');

    final value = stringBuffer.toString();
    return value;
  }
}
