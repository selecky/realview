import 'package:realview/architecture/utils/use_case.dart';
import 'package:realview/features/books/domain/entity/result_entity/get_book_detail_result.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';

class GetBookDetailUseCase extends UseCase<GetBookDetailResult, String> {
  final BooksRepo repo;

  GetBookDetailUseCase({required this.repo});

  @override
  Future<GetBookDetailResult> call({required String params}) async {
    return repo.getBookDetail(isbn13: params);
  }
}
