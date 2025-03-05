import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_book_detail_result.dart';
import 'package:realview/features/books/domain/use_case/get_book_detail_use_case.dart';
import 'package:realview/features/books/presentation/blocs/book_detail_bloc/book_detail_bloc.dart';
import 'package:realview/generic/strings.dart';

class MockGetBookDetailUseCase extends Mock implements GetBookDetailUseCase {}

void main() {
  late BookDetailBloc bookDetailBloc;
  late MockGetBookDetailUseCase mockGetBookDetailUseCase;

  const String isbn13 = '12345';
  const BookDetail testBookDetail = BookDetail(title: 'testBook');

  setUp(() {
    mockGetBookDetailUseCase = MockGetBookDetailUseCase();
    bookDetailBloc = BookDetailBloc(getBookDetailUseCase: mockGetBookDetailUseCase);
  });

  tearDown(() {
    bookDetailBloc.close();
  });

  blocTest<BookDetailBloc, BookDetailState>(
    'emits [BookDetailStateLoading, BookDetailStateSuccess] when GetBookDetailEvent succeeds',
    build: () {
      when(
        () => mockGetBookDetailUseCase.call(params: isbn13),
      ).thenAnswer((_) async => const ResultSuccess(bookDetail: testBookDetail));
      return bookDetailBloc;
    },
    act: (bloc) => bloc.add(const GetBookDetailEvent(isbn13: isbn13)),
    expect:
        () => [
          const BookDetailStateLoading(),
          const BookDetailStateSuccess(bookDetail: testBookDetail),
        ],
  );

  blocTest<BookDetailBloc, BookDetailState>(
    'emits [BookDetailStateLoading, BookDetailStateError] when GetBookDetailEvent fails',
    build: () {
      when(
        () => mockGetBookDetailUseCase.call(params: isbn13),
      ).thenAnswer((_) async => const ResultFailure());
      return bookDetailBloc;
    },
    act: (bloc) => bloc.add(const GetBookDetailEvent(isbn13: isbn13)),
    expect:
        () => [
          const BookDetailStateLoading(),
          BookDetailStateError(errorMessage: Strings.error__get_book_detail.tr()),
        ],
  );
}
