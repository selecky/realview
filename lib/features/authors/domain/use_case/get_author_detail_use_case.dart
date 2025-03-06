import 'package:realview/architecture/utils/use_case.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_author_detail_result.dart';
import 'package:realview/features/authors/domain/repo/authors_repo.dart';

class GetAuthorDetailUseCase extends UseCase<GetAuthorDetailResult, String> {
  final AuthorsRepo repo;

  GetAuthorDetailUseCase({required this.repo});

  @override
  Future<GetAuthorDetailResult> call({required String params}) async {
    return repo.getAuthorDetail(isbn13: params);
  }
}
