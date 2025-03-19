import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_authors_result.dart';
import 'package:realview/features/authors/domain/use_case/get_authors_use_case.dart';
import 'package:realview/features/authors/presentation/blocs/authors_bloc/authors_bloc.dart';
import 'package:realview/features/authors/presentation/navigation/authors_navigation.dart';
import 'package:realview/generic/strings.dart';

class MockGetAuthorsUseCase extends Mock implements GetAuthorsUseCase {}

class MockAuthorsNavigation extends Mock implements AuthorsNavigation {}

void main() {
  late AuthorsBloc authorsBloc;
  late MockGetAuthorsUseCase mockGetAuthorsUseCase;
  late MockAuthorsNavigation mockAuthorsNavigation;

  const String testKeyword = 'testKeyword';
  const AuthorsData testAuthorsData = AuthorsData(docs: []);

  setUp(() {
    mockGetAuthorsUseCase = MockGetAuthorsUseCase();
    mockAuthorsNavigation = MockAuthorsNavigation();
    authorsBloc = AuthorsBloc(
      getAuthorsUseCase: mockGetAuthorsUseCase,
      authorsNavigation: mockAuthorsNavigation,
    );
  });

  tearDown(() {
    authorsBloc.close();
  });

  blocTest<AuthorsBloc, AuthorsState>(
    'emits [AuthorsStateLoading, AuthorsStateSuccess] when GetAuthorsEvent succeeds',
    build: () {
      when(
        () => mockGetAuthorsUseCase.call(params: testKeyword),
      ).thenAnswer((_) async => const ResultSuccess(authorsData: testAuthorsData));
      return authorsBloc;
    },
    act: (bloc) => bloc.add(const GetAuthorsEvent(keyword: testKeyword)),
    expect:
        () => [
          const AuthorsStateLoading(),
          const AuthorsStateSuccess(authorsData: testAuthorsData),
        ],
  );

  blocTest<AuthorsBloc, AuthorsState>(
    'emits [AuthorsStateLoading, AuthorsStateError] when GetAuthorsEvent fails',
    build: () {
      when(
        () => mockGetAuthorsUseCase.call(params: testKeyword),
      ).thenAnswer((_) async => const ResultFailure());
      return authorsBloc;
    },
    act: (bloc) => bloc.add(const GetAuthorsEvent(keyword: testKeyword)),
    expect:
        () => [
          const AuthorsStateLoading(),
          AuthorsStateError(errorMessage: Strings.error__get_authors.tr()),
        ],
  );
}
