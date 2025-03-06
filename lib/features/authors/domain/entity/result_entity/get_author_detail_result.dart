import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realview/features/authors/domain/entity/author_detail.dart';

part 'get_author_detail_result.freezed.dart';

@freezed
class GetAuthorDetailResult with _$GetAuthorDetailResult {
  const factory GetAuthorDetailResult.success({required AuthorDetail authorDetail}) = ResultSuccess;
  const factory GetAuthorDetailResult.failure() = ResultFailure;
}
