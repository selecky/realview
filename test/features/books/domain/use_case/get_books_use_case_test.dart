import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_books_result.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';
import 'package:realview/features/books/domain/use_case/get_books_use_case.dart';

import 'get_books_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BooksRepo>()])
void main() {
  late MockBooksRepo mockRepo;
  late GetBooksUseCase getBooksUseCase;

  const BooksData testBooksData = BooksData(books: [Book(title: 'testTitle')]);

  setUp(() {
    mockRepo = MockBooksRepo();
    getBooksUseCase = GetBooksUseCase(repo: mockRepo);
  });

  test('useCase should call repo and return books data', () async {
    when(
      mockRepo.getBooks(keyword: 'testKeyword'),
    ).thenAnswer((_) async => const ResultSuccess(booksData: testBooksData));

    final result = await getBooksUseCase.call(params: 'testKeyword');

    expect(result, isA<ResultSuccess>());
    if (result is ResultSuccess) {
      expect(result.booksData.books?.first.title, 'testTitle');
    }
  });
}
