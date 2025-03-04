import 'package:flutter/material.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color ?? Colors.yellow));
  }
}
