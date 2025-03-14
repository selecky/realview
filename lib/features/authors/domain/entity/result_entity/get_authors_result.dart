import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';

part 'get_authors_result.freezed.dart';

@freezed
class GetAuthorsResult with _$GetAuthorsResult {
  const factory GetAuthorsResult.success({required AuthorsData authorsData}) = ResultSuccess;
  const factory GetAuthorsResult.failure() = ResultFailure;
  const factory GetAuthorsResult.connectionError() = ResultConnectionError;
}
