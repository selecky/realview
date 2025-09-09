import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/utils/constants.dart';

class HomeNavigation {
  const HomeNavigation();

  Future<void> goToAuthorsScreen({required BuildContext context}) async {
    context.go('/${ScreenNames.authors}');
  }
}
