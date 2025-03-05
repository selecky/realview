import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_book_detail_result.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';
import 'package:realview/features/books/domain/use_case/get_book_detail_use_case.dart';

import 'get_book_detail_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BooksRepo>()])
void main() {
  late MockBooksRepo mockRepo;
  late GetBookDetailUseCase getBookDetailUseCase;

  const BookDetail testBooksDetail = BookDetail(title: 'testTitle');

  setUp(() {
    mockRepo = MockBooksRepo();
    getBookDetailUseCase = GetBookDetailUseCase(repo: mockRepo);
  });

  test('useCase should call repo and return books data', () async {
    when(
      mockRepo.getBookDetail(isbn13: 'testIsbn13'),
    ).thenAnswer((_) async => const ResultSuccess(bookDetail: testBooksDetail));

    final result = await getBookDetailUseCase.call(params: 'testIsbn13');

    expect(result, isA<ResultSuccess>());
    if (result is ResultSuccess) {
      expect(result.bookDetail.title, 'testTitle');
    }
  });
}
