import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_books_result.dart';
import 'package:realview/features/books/domain/use_case/get_books_use_case.dart';
import 'package:realview/features/books/presentation/blocs/books_bloc/books_bloc.dart';
import 'package:realview/features/books/presentation/navigation/books_navigation.dart';
import 'package:realview/generic/strings.dart';

class MockGetBooksUseCase extends Mock implements GetBooksUseCase {}

class MockBooksNavigation extends Mock implements BooksNavigation {}

void main() {
  late BooksBloc booksBloc;
  late MockGetBooksUseCase mockGetBooksUseCase;
  late MockBooksNavigation mockBooksNavigation;

  const String testKeyword = 'testKeyword';
  const BooksData testBooksData = BooksData(books: []);

  setUp(() {
    mockGetBooksUseCase = MockGetBooksUseCase();
    mockBooksNavigation = MockBooksNavigation();
    booksBloc = BooksBloc(getBooksUseCase: mockGetBooksUseCase, navigation: mockBooksNavigation);
  });

  tearDown(() {
    booksBloc.close();
  });

  blocTest<BooksBloc, BooksState>(
    'emits [BooksStateLoading, BooksStateSuccess] when GetBooksEvent succeeds',
    build: () {
      when(
        () => mockGetBooksUseCase.call(params: testKeyword),
      ).thenAnswer((_) async => const ResultSuccess(booksData: testBooksData));
      return booksBloc;
    },
    act: (bloc) => bloc.add(const GetBooksEvent(keyword: testKeyword)),
    expect: () => [const BooksStateLoading(), const BooksStateSuccess(booksData: testBooksData)],
  );

  blocTest<BooksBloc, BooksState>(
    'emits [BooksStateLoading, BooksStateError] when GetBooksEvent fails',
    build: () {
      when(
        () => mockGetBooksUseCase.call(params: testKeyword),
      ).thenAnswer((_) async => const ResultFailure());
      return booksBloc;
    },
    act: (bloc) => bloc.add(const GetBooksEvent(keyword: testKeyword)),
    expect:
        () => [
          const BooksStateLoading(),
          BooksStateError(errorMessage: Strings.error__get_books.tr()),
        ],
  );
}
