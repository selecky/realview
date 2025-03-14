import 'package:logging/logging.dart';
import 'package:realview/features/authors/data/converter/authors_converter.dart';
import 'package:realview/features/authors/data/data_source/authors_api.dart';
import 'package:realview/features/authors/data/dto/authors_data_dto.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_authors_result.dart';
import 'package:realview/features/authors/domain/repo/authors_repo.dart';
import 'package:realview/generic/strings.dart';

final _log = Logger('authors_repo_impl');

class AuthorsRepoImpl extends AuthorsRepo {
  final AuthorsApi api;

  AuthorsRepoImpl({required this.api});

  @override
  Future<GetAuthorsResult> getAuthors({required String keyword}) async {
    try {
      final AuthorsDataDto resultDto = await api.getAuthors(keyword: keyword);
      return GetAuthorsResult.success(authorsData: resultDto.toDomain());
    } catch (e, trace) {
      _log.warning('error getting authors', e, trace);
      if (e.toString().contains(Strings.connection_error)) {
        return const GetAuthorsResult.connectionError();
      } else {
        return const GetAuthorsResult.failure();
      }
    }
  }
}
