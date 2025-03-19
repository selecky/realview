part of 'author_detail_bloc.dart';

abstract class AuthorDetailEvent extends Equatable {
  const AuthorDetailEvent();
}

class GetAuthorDetailEvent extends AuthorDetailEvent {
  final String authorId;

  const GetAuthorDetailEvent({required this.authorId});

  @override
  List<Object?> get props => [authorId];
}
