import 'package:bloc_test/bloc_test.dart';
import 'package:codeunion/home/cubit/home_cubit.dart';
import 'package:codeunion/home/cubit/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeCubit', () {
    test('initial state is Tape', () {
      expect(
        HomeCubit().state,
        equals(
          const HomeState(),
        ),
      );
    });

    blocTest<HomeCubit, HomeState>(
      'sets currentTab to profile when profile state is emitted',
      build: HomeCubit.new,
      act: (cubit) => cubit.setTab(HomeTab.profile),
      expect: () => [
        equals(
          equals(
            const HomeState(
              currentTab: HomeTab.profile,
            ),
          ),
        )
      ],
    );
  });
}
