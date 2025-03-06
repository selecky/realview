import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authors_data_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthorsDataDto extends Equatable {
  final String? error;
  final String? total;
  final String? page;
  final List<AuthorDto>? authors;

  const AuthorsDataDto({this.error, this.total, this.page, this.authors});

  @override
  List<Object?> get props => [error, total, page, authors];

  factory AuthorsDataDto.fromJson(Map<String, dynamic> json) => _$AuthorsDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorsDataDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuthorDto extends Equatable {
  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? image;
  final String? url;

  const AuthorDto({this.title, this.subtitle, this.isbn13, this.image, this.url});

  @override
  List<Object?> get props => [title, subtitle, isbn13, image, url];

  factory AuthorDto.fromJson(Map<String, dynamic> json) => _$AuthorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDtoToJson(this);
}
