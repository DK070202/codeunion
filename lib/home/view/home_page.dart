import 'package:codeunion/app/config/icons/app_icons.dart';
import 'package:codeunion/home/cubit/home_cubit.dart';
import 'package:codeunion/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(
        child: child,
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const _HomeNavBar(),
    );
  }
}

class _HomeNavBar extends StatelessWidget {
  const _HomeNavBar();

  /// Updates the current tab state inside home page.
  void _onTap(
    BuildContext context,
    int index,
    HomeCubit cubit,
  ) {
    final targetedState = HomeTab.values.firstWhere(
      (element) => element.tabIndex == index,
    );
    cubit.setTab(targetedState);
    context.go(targetedState.route);
  }

  /// Provides the current state of tab.
  ///
  /// Form the current state of router finds match where current location of
  /// [GoRouterState.location] has match to [HomeTab.route].
  ///
  /// In the case of deeplink this strategy will make ui state independent of
  /// the user action.
  int _getSelectedIndex(BuildContext context) {
    final currentLocation = GoRouterState.of(context).location;
    final targetState = HomeTab.values.firstWhere(
      (element) => currentLocation.contains(element.route),
    );
    return targetState.tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();

    return BottomNavigationBar(
      currentIndex: _getSelectedIndex(context),
      onTap: (index) => _onTap(context, index, cubit),
      items: const [
        BottomNavigationBarItem(
          label: 'Лента',
          icon: Icon(AppIcons.tape),
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.map),
          label: 'Карта',
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.selected),
          label: 'Избранные',
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.profile),
          label: 'Профиль',
        ),
      ],
    );
  }
}
