part of 'dark_mode_bloc.dart';

abstract class DarkModeEvent extends Equatable {
  const DarkModeEvent();
}

class SetIsDarkModeEvent extends DarkModeEvent {
  const SetIsDarkModeEvent({required this.isDark});

  final bool isDark;

  @override
  List<Object?> get props => [isDark];
}

class InitDarkModeEvent extends DarkModeEvent {
  const InitDarkModeEvent();

  @override
  List<Object?> get props => [];
}
