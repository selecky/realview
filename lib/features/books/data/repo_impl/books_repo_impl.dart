import 'package:logging/logging.dart';
import 'package:realview/features/books/data/converter/book_detail_converter.dart';
import 'package:realview/features/books/data/converter/books_converter.dart';
import 'package:realview/features/books/data/data_source/books_api.dart';
import 'package:realview/features/books/data/dto/book_detail_dto.dart';
import 'package:realview/features/books/data/dto/books_data_dto.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_book_detail_result.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_books_result.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';

final _log = Logger('books_repo_impl');

class BooksRepoImpl extends BooksRepo {
  final BooksApi api;

  BooksRepoImpl({required this.api});

  @override
  Future<GetBooksResult> getBooks({required String keyword}) async {
    try {
      final BooksDataDto resultDto = await api.getBooks(keyword: keyword);
      return GetBooksResult.success(booksData: resultDto.toDomain());
    } catch (e, trace) {
      _log.warning('error getting books', e, trace);
      return const GetBooksResult.failure();
    }
  }

  @override
  Future<GetBookDetailResult> getBookDetail({required String isbn13}) async {
    try {
      final BookDetailDto resultDto = await api.getBookDetail(isbn13: isbn13);
      return GetBookDetailResult.success(bookDetail: resultDto.toDomain());
    } catch (e, trace) {
      _log.warning('error getting book detail', e, trace);
      return const GetBookDetailResult.failure();
    }
  }
}
