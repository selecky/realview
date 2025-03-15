import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:realview/architecture/app.dart';
import 'package:realview/features/dark_mode/presentation/blocs/dark_mode_bloc.dart';
import 'package:realview/main_widget.dart';
import 'package:requests_inspector/requests_inspector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await App.I.init();

  runApp(
    RequestsInspector(
      enabled: false,
      showInspectorOn: ShowInspectorOn.Shaking,
      hideInspectorBanner: true,
      navigatorKey: null,
      child: EasyLocalization(
        supportedLocales: const [Locale('de'), Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('de'),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<DarkModeBloc>.value(
              value: GetIt.I.get<DarkModeBloc>()..add(const InitDarkModeEvent()),
            ),
          ],
          child: const MainWidget(),
        ),
      ),
    ),
  );
}
