part of 'authors_bloc.dart';

abstract class AuthorsEvent extends Equatable {
  const AuthorsEvent();
}

class GetAuthorsEvent extends AuthorsEvent {
  final String keyword;

  const GetAuthorsEvent({required this.keyword});

  @override
  List<Object?> get props => [keyword];
}

class GoToAuthorDetailScreenEvent extends AuthorsEvent {
  final BuildContext context;
  final String isbn13;

  const GoToAuthorDetailScreenEvent({required this.context, required this.isbn13});

  @override
  List<Object?> get props => [context, isbn13];
}
