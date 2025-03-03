import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:realview/features/dark_mode/presentation/widgets/dark_mode_switch.dart';
import 'package:realview/generic/constants.dart';
import 'package:realview/generic/strings.dart';

final _log = Logger('app_shell_app_bar');

class ShellAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShellAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        borderRadius: BorderRadius.circular(Constants.radiusCard),
        child: Image.asset('assets/images/app_logo.png'),
        onTap: () {
          _log.info('app logo tapped');
        },
      ),
      title: Text(Strings.app_title.tr()),
      actions: [
        DarkModeSwitch(),
        InkWell(
          onTap: () {
            _log.info('shell action tapped');
          },
          child: Icon(Icons.ac_unit),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
