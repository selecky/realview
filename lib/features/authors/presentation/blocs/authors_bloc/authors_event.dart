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
