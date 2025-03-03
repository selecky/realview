import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, state) {
        final bool isDarkMode = state is DarkModeStateSuccess && state.isDark;
        App.I.initAppTheme(isDarkMode: isDarkMode);

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
          ),
        );

        return MaterialApp.router(
          routerConfig: App.goRouter,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: App.appTheme,
        );
      },
    );
  }
}
