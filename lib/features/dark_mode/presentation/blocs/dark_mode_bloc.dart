import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/features/dark_mode/domain/repo/dark_mode_repo.dart';

part 'dark_mode_event.dart';

part 'dark_mode_state.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {
  final DarkModeRepo repo;

  DarkModeBloc({required this.repo}) : super(const DarkModeStateSuccess(isDark: false)) {
    on<InitDarkModeEvent>(_onInitDarkModeEvent);
    on<SetIsDarkModeEvent>(_onSetIsDarkModeEvent);
  }

  Future<void> _onInitDarkModeEvent(InitDarkModeEvent event, Emitter<DarkModeState> emit) async {
    final bool isDark = await repo.loadIsDark() ?? false;
    emit(DarkModeStateSuccess(isDark: isDark));
  }

  Future<void> _onSetIsDarkModeEvent(SetIsDarkModeEvent event, Emitter<DarkModeState> emit) async {
    await repo.storeIsDark(isDark: event.isDark);
    emit(DarkModeStateSuccess(isDark: event.isDark));
  }
}
