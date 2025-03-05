import 'package:realview/features/books/domain/entity/result_entity/get_book_detail_result.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_books_result.dart';

abstract class BooksRepo {
  Future<GetBooksResult> getBooks({required String keyword});
  Future<GetBookDetailResult> getBookDetail({required String isbn13});
}
