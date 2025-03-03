import 'package:realview/architecture/utils/network_result.dart';
import 'package:realview/architecture/utils/use_case.dart';
import 'package:realview/features/books/domain/entity/books_data.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';

class GetBooksUseCase extends UseCase<NetworkResult<BooksData>, String> {
  final BooksRepo repo;

  GetBooksUseCase({required this.repo});

  @override
  Future<NetworkResult<BooksData>> call({required String params}) async {
    return repo.getBooks(keyword: params);
  }
}
