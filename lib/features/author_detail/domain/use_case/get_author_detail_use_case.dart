import 'package:realview/architecture/utils/use_case.dart';
import 'package:realview/features/author_detail/domain/entity/result_entity/get_author_detail_result.dart';
import 'package:realview/features/author_detail/domain/repo/author_detail_repo.dart';

class GetAuthorDetailUseCase extends UseCase<GetAuthorDetailResult, String> {
  final AuthorDetailRepo repo;

  GetAuthorDetailUseCase({required this.repo});

  @override
  Future<GetAuthorDetailResult> call({required String params}) async {
    return repo.getAuthorDetail(authorId: params);
  }
}
