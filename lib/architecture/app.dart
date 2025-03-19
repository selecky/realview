import 'dart:async';
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:realview/architecture/utils/app_module.dart';
import 'package:realview/features/author_detail/author_detail_module.dart';
import 'package:realview/features/authors/authors_module.dart';
import 'package:realview/features/dark_mode/dark_mode_module.dart';
import 'package:realview/features/home/home_module.dart';
import 'package:realview/features/shell/shell_module.dart';
import 'package:realview/generic/constants.dart';
import 'package:realview/generic/strings.dart';
import 'package:requests_inspector/requests_inspector.dart';

part 'app_dio.dart';
part 'app_logger.dart';
part 'app_router.dart';
part 'app_theme.dart';

class App {
  App._();
  static final App _instance = App._();
  static App get I => _instance;

  ThemeData _appTheme = ThemeData();
  static ThemeData get appTheme => I._appTheme;

  bool _isDarkMode = false;
  static bool get isDarkMode => I._isDarkMode;

  final Queue<String> _logsQueue = Queue();
  static Queue<String> get logsQueue => I._logsQueue;

  final GoRouter _goRouter = _appRouter;
  static GoRouter get goRouter => I._goRouter;

  static const Dio Function({required String endpoint}) getDio = _getDio;

  final List<AppModule> _modules = [
    AuthorsModule(),
    DarkModeModule(),
    HomeModule(),
    ShellModule(),
    AuthorDetailModule(),
  ];

  Future<void> init() async {
    _configureLogger();
    registerModules();
  }

  void initAppTheme({required bool isDarkMode}) {
    _isDarkMode = isDarkMode;
    _appTheme = _getAppTheme();
  }

  void registerModules() {
    for (final module in _modules) {
      module.registerDependencies();
    }
  }
}
