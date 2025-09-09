import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';
import 'package:realview/utils/constants.dart';

final _log = Logger('dark_mode_switch');

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(Constants.radiusCard),
        onTap: () async {
          _log.info('dark_mode_switch tapped');
          if (App.isDarkMode) {
            context.read<DarkModeBloc>().add(const SetIsDarkModeEvent(isDark: false));
          } else {
            context.read<DarkModeBloc>().add(const SetIsDarkModeEvent(isDark: true));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            App.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).app_textColor,
            size: 32,
          ),
        ),
      ),
    );
  }
}
