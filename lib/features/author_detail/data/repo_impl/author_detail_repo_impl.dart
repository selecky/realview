import 'package:logging/logging.dart';
import 'package:realview/features/author_detail/data/converter/author_detail_converter.dart';
import 'package:realview/features/author_detail/data/data_source/author_detail_api.dart';
import 'package:realview/features/author_detail/data/dto/author_detail_dto.dart';
import 'package:realview/features/author_detail/domain/entity/result_entity/get_author_detail_result.dart';
import 'package:realview/features/author_detail/domain/repo/author_detail_repo.dart';
import 'package:realview/utils/strings.dart';

final _log = Logger('author_detail_repo_impl');

class AuthorDetailRepoImpl extends AuthorDetailRepo {
  final AuthorDetailApi api;

  AuthorDetailRepoImpl({required this.api});

  @override
  Future<GetAuthorDetailResult> getAuthorDetail({required String authorId}) async {
    try {
      final AuthorDetailDto resultDto = await api.getAuthorDetail(authorId: authorId);
      return GetAuthorDetailResult.success(authorDetail: resultDto.toDomain());
    } catch (e, trace) {
      _log.warning('error getting author_detail', e, trace);
      if (e.toString().contains(Strings.connection_error)) {
        return const GetAuthorDetailResult.connectionError();
      } else {
        return const GetAuthorDetailResult.failure();
      }
    }
  }
}
