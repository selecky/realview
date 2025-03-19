import 'package:dio/dio.dart';
import 'package:realview/features/author_detail/data/dto/author_detail_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'author_detail_api.g.dart';

@RestApi()
abstract class AuthorDetailApi {
  factory AuthorDetailApi(Dio dio) = _AuthorDetailApi;

  @GET('/authors/{authorId}.json')
  Future<AuthorDetailDto> getAuthorDetail({@Path('authorId') required String authorId});
}
