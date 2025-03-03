import 'package:flutter/material.dart';
import 'package:realview/features/shell/presentation/widgets/shell_app_bar.dart';

class ShellScreen extends StatelessWidget {
  final Widget child;

  const ShellScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const ShellAppBar(), body: child);
  }
}
