import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:realview/architecture/app.dart';

final _log = Logger('app_screen');

class AppScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hasBackButton;

  const AppScreen({super.key, required this.title, required this.child, this.hasBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (hasBackButton)
                  InkWell(
                    onTap: () {
                      context.pop();
                      _log.info('back button tapped');
                    },
                    child: Icon(Icons.arrow_back_ios, color: Theme.of(context).app_textColor,),
                  ),
                Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            child,
          ],
        ),
      ),
    );
  }
}
