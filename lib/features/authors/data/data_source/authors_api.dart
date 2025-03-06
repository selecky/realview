import 'package:dio/dio.dart';
import 'package:realview/features/authors/data/dto/authors_data_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'authors_api.g.dart';

@RestApi()
abstract class AuthorsApi {
  factory AuthorsApi(Dio dio) = _AuthorsApi;

  @GET('/search/authors.json')
  Future<AuthorsDataDto> getAuthors({@Query('q') required String keyword});
}
