import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/generic/constants.dart';
import 'package:realview/generic/strings.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    this.title,
    required this.errorMessage,
    this.subtitle,
    this.onTryAgain,
    super.key,
  });

  final String? title;
  final String? subtitle;
  final String errorMessage;
  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    final bool isConnectionError = errorMessage.contains('connection error');
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 240),
        decoration: BoxDecoration(
          color: App.appTheme.app_backgroundColor,
          borderRadius: BorderRadius.circular(Constants.radiusCard),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isConnectionError ? Strings.error__network.tr() : title ?? Strings.error,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (isConnectionError || subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    isConnectionError ? Strings.error__network_info.tr() : subtitle!,
                    textAlign: TextAlign.center,
                  ),
                ),
              if (onTryAgain != null) _RefreshButton(onTryAgain: onTryAgain),
            ],
          ),
        ),
      ),
    );
  }
}

class _RefreshButton extends StatelessWidget {
  const _RefreshButton({required this.onTryAgain});

  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: InkWell(
        onTap: onTryAgain,
        child: Container(
          decoration: BoxDecoration(
            color: App.appTheme.primaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              Strings.try_again.tr().toUpperCase(),
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(color: App.appTheme.app_textColorWhite),
            ),
          ),
        ),
      ),
    );
  }
}
