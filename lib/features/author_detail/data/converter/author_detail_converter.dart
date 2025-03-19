import 'package:realview/features/author_detail/data/dto/author_detail_dto.dart';
import 'package:realview/features/author_detail/domain/entity/author_detail.dart';

extension AuthorDetailDtoConverter on AuthorDetailDto {
  AuthorDetail toDomain() {
    return AuthorDetail(
      personalName: personalName,
      birthDate: birthDate,
      bio: bio,
      links: links?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension AuthorLinkDtoConverter on AuthorLinkDto {
  AuthorLink toDomain() {
    return AuthorLink(title: title, url: url);
  }
}
