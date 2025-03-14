import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_authors_result.dart';
import 'package:realview/features/authors/domain/use_case/get_authors_use_case.dart';
import 'package:realview/generic/strings.dart';

part 'authors_event.dart';
part 'authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  final GetAuthorsUseCase getAuthorsUseCase;

  AuthorsBloc({required this.getAuthorsUseCase}) : super(const AuthorsStateInit()) {
    on<GetAuthorsEvent>(_onGetAuthorsEvent);
  }

  Future<void> _onGetAuthorsEvent(GetAuthorsEvent event, Emitter<AuthorsState> emit) async {
    emit(const AuthorsStateLoading());
    final GetAuthorsResult result = await getAuthorsUseCase.call(params: event.keyword);
    switch (result) {
      case final ResultSuccess success:
        emit(AuthorsStateSuccess(authorsData: success.authorsData));
      case ResultFailure():
        emit(AuthorsStateError(errorMessage: Strings.error__get_authors.tr()));
      case ResultConnectionError():
        emit(AuthorsStateError(errorMessage: Strings.error__network.tr()));
    }
  }
}
