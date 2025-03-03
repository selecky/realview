import 'package:flutter/material.dart';
import 'package:realview/features/dark_mode/presentation/widgets/dark_mode_switch.dart';
import 'package:realview/features/shell/presentation/widgets/app_logo.dart';

class ShellAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShellAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const AppLogo(), actions: const [DarkModeSwitch()]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
