import 'package:codeunion/app/router/router.dart';
import 'package:codeunion/presentation/home/home.dart';
import 'package:codeunion/presentation/login/login.dart';
import 'package:codeunion/presentation/profile/profile.dart';
import 'package:flutter/material.dart';
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
    initialLocation: AppRoutes.login,
    navigatorKey: _rootKey,
    routes: [
      ShellRoute(
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
        path: AppRoutes.login,
        builder: (ctx, state) => const LoginPage(),
      )
    ],
  );
}
