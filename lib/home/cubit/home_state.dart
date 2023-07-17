import 'package:codeunion/app/router/router.dart';
import 'package:equatable/equatable.dart';

enum HomeTab {
  tape(0, AppRoutes.tape),
  map(1, AppRoutes.map),
  selected(2, AppRoutes.selected),
  profile(3, AppRoutes.profile);

  const HomeTab(this.tabIndex, this.route);
  final int tabIndex;
  final String route;
}

final class HomeState extends Equatable {
  const HomeState({
    this.currentTab = HomeTab.tape,
  });

  final HomeTab currentTab;

  @override
  List<Object?> get props => [
        currentTab,
      ];
}
