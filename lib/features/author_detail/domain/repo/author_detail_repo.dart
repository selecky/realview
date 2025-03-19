import 'package:realview/features/author_detail/domain/entity/result_entity/get_author_detail_result.dart';

abstract class AuthorDetailRepo {
  Future<GetAuthorDetailResult> getAuthorDetail({required String authorId});
}
