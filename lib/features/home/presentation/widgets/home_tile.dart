import 'package:flutter/material.dart';
import 'package:realview/architecture/app.dart';

class HomeTile extends StatelessWidget {
  final void Function() onTap;
  final IconData iconData;
  final String title;

  const HomeTile({super.key, required this.onTap, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(iconData, size: 80, color: Theme.of(context).app_textColor),
            Text(title, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
