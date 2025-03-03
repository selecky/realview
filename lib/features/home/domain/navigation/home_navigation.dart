import 'package:realview/generic/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeNavigation {
  const HomeNavigation();

  Future<void> goToDetailScreen({required BuildContext context}) async {
    context.go('/${ScreenNames.detail}');
  }
}
