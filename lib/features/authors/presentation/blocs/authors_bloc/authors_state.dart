part of 'authors_bloc.dart';

sealed class AuthorsState extends Equatable {
  const AuthorsState();
}

class AuthorsStateLoading extends AuthorsState {
  const AuthorsStateLoading();

  @override
  List<Object> get props => [];
}

class AuthorsStateSuccess extends AuthorsState {
  final AuthorsData? authorsData;

  const AuthorsStateSuccess({required this.authorsData});

  @override
  List<Object?> get props => [authorsData];
}

class AuthorsStateError extends AuthorsState {
  final String errorMessage;

  const AuthorsStateError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
