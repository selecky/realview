import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final Widget content;
  final void Function()? onTap;
  final Color? color;

  const AppListTile({super.key, required this.content, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            content,
            const SizedBox(height: 8),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
