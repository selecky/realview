import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realview/generic/strings.dart';
import 'package:realview/generic/widgets/app_button_text.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({required this.text, this.onTryAgain, super.key});

  final String? text;
  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text ?? Strings.error.tr()),
        if (onTryAgain != null)
          Padding(
            padding: const EdgeInsets.all(8),
            child: AppButtonText(onTap: onTryAgain!, text: Strings.try_again.tr()),
          ),
      ],
    );
  }
}
