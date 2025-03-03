import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/features/home/domain/navigation/home_navigation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeNavigation navigation;

  HomeBloc({required this.navigation}) : super(HomeStateSuccess()) {
    on<GoToBooksScreenEvent>(_onGoToBooksScreenEvent);
  }

  Future<void> _onGoToBooksScreenEvent(GoToBooksScreenEvent event, Emitter<HomeState> emit) async {
    await navigation.goToBooksScreen(context: event.context);
  }
}
