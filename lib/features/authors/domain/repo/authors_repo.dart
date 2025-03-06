import 'package:realview/features/authors/domain/entity/result_entity/get_author_detail_result.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_authors_result.dart';

abstract class AuthorsRepo {
  Future<GetAuthorsResult> getAuthors({required String keyword});
  Future<GetAuthorDetailResult> getAuthorDetail({required String isbn13});
}
