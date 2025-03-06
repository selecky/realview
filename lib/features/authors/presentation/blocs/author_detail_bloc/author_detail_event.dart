part of 'author_detail_bloc.dart';

abstract class AuthorDetailEvent extends Equatable {
  const AuthorDetailEvent();
}

class GetAuthorDetailEvent extends AuthorDetailEvent {
  final String isbn13;

  const GetAuthorDetailEvent({required this.isbn13});

  @override
  List<Object?> get props => [isbn13];
}
