import 'package:flutter/material.dart';
import 'package:realview/architecture/app.dart';

class AuthorAttributeWidget extends StatelessWidget {
  final String? authorAttribute;
  final Widget? leading;

  const AuthorAttributeWidget({super.key, required this.authorAttribute, this.leading});

  @override
  Widget build(BuildContext context) {
    if (authorAttribute?.isNotEmpty ?? false) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            leading ?? const SizedBox(),
            const SizedBox(width: 4),
            Flexible(
              child: Text(authorAttribute!, style: Theme.of(context).textTheme.app_bodyMediumGrey),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
