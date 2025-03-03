import 'package:realview/architecture/utils/network_result.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';

abstract class BooksRepo {
  Future<NetworkResult<BooksData>> getBooks({required String keyword});
  Future<NetworkResult<BookDetail>> getBookDetail({required String isbn13});
}
