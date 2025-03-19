part of 'author_detail_bloc.dart';

sealed class AuthorDetailState extends Equatable {
  const AuthorDetailState();
}

class AuthorDetailStateInit extends AuthorDetailState {
  const AuthorDetailStateInit();

  @override
  List<Object> get props => [];
}

class AuthorDetailStateLoading extends AuthorDetailState {
  const AuthorDetailStateLoading();

  @override
  List<Object> get props => [];
}

class AuthorDetailStateSuccess extends AuthorDetailState {
  final AuthorDetail? authorDetail;

  const AuthorDetailStateSuccess({required this.authorDetail});

  @override
  List<Object?> get props => [authorDetail];
}

class AuthorDetailStateError extends AuthorDetailState {
  final String errorMessage;

  const AuthorDetailStateError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
