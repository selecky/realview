import 'package:realview/features/authors/domain/entity/result_entity/get_authors_result.dart';

abstract class AuthorsRepo {
  Future<GetAuthorsResult> getAuthors({required String keyword});
}
