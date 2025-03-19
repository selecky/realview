import 'package:equatable/equatable.dart';

class AuthorDetail extends Equatable {
  final String? personalName;
  final String? birthDate;
  final String? bio;
  final List<AuthorLink>? links;

  const AuthorDetail({this.personalName, this.birthDate, this.bio, this.links});

  @override
  List<Object?> get props => [personalName, birthDate, bio, links];
}

class AuthorLink extends Equatable {
  final String? title;
  final String? url;

  const AuthorLink({this.title, this.url});

  @override
  List<Object?> get props => [title, url];
}
