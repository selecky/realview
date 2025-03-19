import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_detail_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AuthorDetailDto extends Equatable {
  final String? personalName;
  final String? birthDate;
  final String? bio;
  final List<AuthorLinkDto>? links;

  const AuthorDetailDto({this.personalName, this.birthDate, this.bio, this.links});

  @override
  List<Object?> get props => [personalName, birthDate, bio, links];

  factory AuthorDetailDto.fromJson(Map<String, dynamic> json) => _$AuthorDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDetailDtoToJson(this);
}

@JsonSerializable()
class AuthorLinkDto extends Equatable {
  final String? title;
  final String? url;

  const AuthorLinkDto({this.title, this.url});

  @override
  List<Object?> get props => [title, url];

  factory AuthorLinkDto.fromJson(Map<String, dynamic> json) => _$AuthorLinkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorLinkDtoToJson(this);
}
