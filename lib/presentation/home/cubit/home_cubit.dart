import 'package:bloc/bloc.dart';
import 'package:codeunion/presentation/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit([
    super.initialState = const HomeState(),
  ]);

  void setTab(HomeTab homeTab) => emit(
        HomeState(currentTab: homeTab),
      );
}
