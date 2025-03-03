import 'package:realview/architecture/utils/network_result.dart';
import 'package:realview/architecture/utils/use_case.dart';
import 'package:realview/features/books/domain/entity/book_detail.dart';
import 'package:realview/features/books/domain/repo/book_repo.dart';

class GetBookDetailUseCase extends UseCase<NetworkResult<BookDetail>, String> {
  final BooksRepo repo;

  GetBookDetailUseCase({required this.repo});

  @override
  Future<NetworkResult<BookDetail>> call({required String params}) async {
    return repo.getBookDetail(isbn13: params);
  }
}
