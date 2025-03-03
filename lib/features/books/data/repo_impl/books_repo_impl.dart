import 'package:logging/logging.dart';
import 'package:realview/architecture/utils/network_result.dart';
import 'package:realview/features/books/data/converter/book_detail_converter.dart';
import 'package:realview/features/books/data/converter/books_converter.dart';
import 'package:realview/features/books/data/data_source/books_api.dart';
import 'package:realview/features/books/data/dto/book_detail_dto.dart';
import 'package:realview/features/books/data/dto/books_data_dto.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';

final _log = Logger('books_repo_impl');

class BooksRepoImpl extends BooksRepo {
  final BooksApi api;

  BooksRepoImpl({required this.api});

  @override
  Future<NetworkResult<BooksData>> getBooks({required String keyword}) async {
    try {
      final BooksDataDto resultDto = await api.getBooks(keyword: keyword);
      return NetworkResultSuccess(data: resultDto.toDomain());
    } catch (e, trace) {
      _log.warning('error getting books', e, trace);
      return const NetworkResultFailure();
    }
  }

  @override
  Future<NetworkResult<BookDetail>> getBookDetail({required String isbn13}) async {
    try {
      final BookDetailDto resultDto = await api.getBookDetail(isbn13: isbn13);
      return NetworkResultSuccess(data: resultDto.toDomain());
    } catch (e, trace) {
      _log.warning('error getting book detail', e, trace);
      return NetworkResultFailure(errorMessage: e.toString());
    }
  }
}
