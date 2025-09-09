import 'package:realview/utils/use_case.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_authors_result.dart';
import 'package:realview/features/authors/domain/repo/authors_repo.dart';

class GetAuthorsUseCase extends UseCase<GetAuthorsResult, String> {
  final AuthorsRepo repo;

  GetAuthorsUseCase({required this.repo});

  @override
  Future<GetAuthorsResult> call({required String params}) async {
    return repo.getAuthors(keyword: params);
  }
}
