import 'package:flutter/material.dart';
import 'package:realview/architecture/app.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color ?? App.appTheme.primaryColor));
  }
}
