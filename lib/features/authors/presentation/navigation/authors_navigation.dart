import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realview/generic/constants.dart';

class AuthorsNavigation {
  const AuthorsNavigation();

  Future<void> goToAuthorDetailScreen({
    required BuildContext context,
    required String authorId,
  }) async {
    context.go('/${ScreenNames.authors}/${ScreenNames.authorDetail}/$authorId');
  }
}
