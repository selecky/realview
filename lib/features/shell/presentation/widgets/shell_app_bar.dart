import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logging/logging.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';
import 'package:realview/features/dark_mode/presentation/widgets/dark_mode_switch.dart';
import 'package:realview/features/shell/presentation/widgets/app_logo.dart';
import 'package:realview/generic/constants.dart';
import 'package:realview/generic/strings.dart';

final _log = Logger('app_shell_app_bar');

class ShellAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShellAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: ToggleButtons(children: children, isSelected: isSelected),
      title: AppLogo(),
      actions: [DarkModeSwitch()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}