import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:realview/features/dark_mode/domain/repo/dark_mode_repo.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';

import 'dark_mode_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DarkModeRepo>()])
void main() {
  late MockDarkModeRepo repo;
  late DarkModeBloc bloc;

  setUp(() {
    repo = MockDarkModeRepo();
    bloc = DarkModeBloc(repo: repo);
  });

  test('Initial mode should be light', () {
    expect(bloc.state, equals(const DarkModeStateSuccess(isDark: false)));
  });

  test('After closing bloc does not emit any states', () {
    expectLater(bloc.stream, emitsDone);
    bloc.close();
  });
}
