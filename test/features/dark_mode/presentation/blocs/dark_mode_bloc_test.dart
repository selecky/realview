import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:realview/features/dark_mode/domain/repo/dark_mode_repo.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';

import 'dark_mode_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DarkModeRepo>()])
void main() {
  late MockDarkModeRepo mockRepo;
  late DarkModeBloc bloc;

  setUp(() {
    mockRepo = MockDarkModeRepo();
    bloc = DarkModeBloc(repo: mockRepo);
  });

  test('initial state is DarkModeStateSuccess with isDark false', () {
    expect(bloc.state, const DarkModeStateSuccess(isDark: false));
  });

  test('InitDarkModeEvent loads and emits correct state', () async {
    when(mockRepo.loadIsDark()).thenAnswer((_) async => true);
    bloc.add(const InitDarkModeEvent());
    await expectLater(bloc.stream, emits(const DarkModeStateSuccess(isDark: true)));
  });

  test('SetIsDarkModeEvent updates and emits new state', () async {
    bloc.add(const SetIsDarkModeEvent(isDark: true));
    await expectLater(bloc.stream, emits(const DarkModeStateSuccess(isDark: true)));
    verify(mockRepo.storeIsDark(isDark: true)).called(1);
  });
}
