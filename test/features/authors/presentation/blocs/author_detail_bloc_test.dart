import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realview/features/authors/domain/entity/author_detail.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_author_detail_result.dart';
import 'package:realview/features/authors/domain/use_case/get_author_detail_use_case.dart';
import 'package:realview/features/authors/presentation/blocs/author_detail_bloc/author_detail_bloc.dart';
import 'package:realview/generic/strings.dart';

class MockGetAuthorDetailUseCase extends Mock implements GetAuthorDetailUseCase {}

void main() {
  late AuthorDetailBloc authorDetailBloc;
  late MockGetAuthorDetailUseCase mockGetAuthorDetailUseCase;

  const String isbn13 = '12345';
  const AuthorDetail testAuthorDetail = AuthorDetail(title: 'testAuthor');

  setUp(() {
    mockGetAuthorDetailUseCase = MockGetAuthorDetailUseCase();
    authorDetailBloc = AuthorDetailBloc(getAuthorDetailUseCase: mockGetAuthorDetailUseCase);
  });

  tearDown(() {
    authorDetailBloc.close();
  });

  blocTest<AuthorDetailBloc, AuthorDetailState>(
    'emits [AuthorDetailStateLoading, AuthorDetailStateSuccess] when GetAuthorDetailEvent succeeds',
    build: () {
      when(
        () => mockGetAuthorDetailUseCase.call(params: isbn13),
      ).thenAnswer((_) async => const ResultSuccess(authorDetail: testAuthorDetail));
      return authorDetailBloc;
    },
    act: (bloc) => bloc.add(const GetAuthorDetailEvent(isbn13: isbn13)),
    expect:
        () => [
          const AuthorDetailStateLoading(),
          const AuthorDetailStateSuccess(authorDetail: testAuthorDetail),
        ],
  );

  blocTest<AuthorDetailBloc, AuthorDetailState>(
    'emits [AuthorDetailStateLoading, AuthorDetailStateError] when GetAuthorDetailEvent fails',
    build: () {
      when(
        () => mockGetAuthorDetailUseCase.call(params: isbn13),
      ).thenAnswer((_) async => const ResultFailure());
      return authorDetailBloc;
    },
    act: (bloc) => bloc.add(const GetAuthorDetailEvent(isbn13: isbn13)),
    expect:
        () => [
          const AuthorDetailStateLoading(),
          AuthorDetailStateError(errorMessage: Strings.error__get_author_detail.tr()),
        ],
  );
}
