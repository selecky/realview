import 'package:realview/architecture/utils/use_case.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_books_result.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';

class GetBooksUseCase extends UseCase<GetBooksResult, String> {
  final BooksRepo repo;

  GetBooksUseCase({required this.repo});

  @override
  Future<GetBooksResult> call({required String params}) async {
    return repo.getBooks(keyword: params);
  }
}
