part of 'dark_mode_bloc.dart';

sealed class DarkModeState extends Equatable {
  const DarkModeState();
}

class DarkModeStateSuccess extends DarkModeState {
  const DarkModeStateSuccess({required this.isDark});

  final bool isDark;

  @override
  List<Object> get props => [isDark];
}
