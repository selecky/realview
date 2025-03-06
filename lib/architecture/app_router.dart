part of 'app.dart';

final _log = Logger('app_router');

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final _appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [_AppNavigatorObserver()],
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder:
          (context, state, child) =>
              GetIt.I.get<Widget>(param1: state, param2: child, instanceName: ScreenNames.shell),
      routes: [
        GoRoute(
          path: '/',
          name: ScreenNames.home,
          builder:
              (context, state) => GetIt.I.get<Widget>(
                instanceName: ScreenNames.home,
                param1: state,
                param2: context,
              ),
          routes: [
            GoRoute(
              path: ScreenNames.authors,
              name: ScreenNames.authors,
              builder:
                  (context, state) => GetIt.I.get<Widget>(
                    instanceName: ScreenNames.authors,
                    param1: state,
                    param2: context,
                  ),
              routes: [
                GoRoute(
                  path: '${ScreenNames.authorDetail}/:isbn13',
                  name: ScreenNames.authorDetail,
                  builder:
                      (context, state) => GetIt.I.get<Widget>(
                        instanceName: ScreenNames.authorDetail,
                        param1: state,
                        param2: context,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class _AppNavigatorObserver extends NavigatorObserver {
  @override
  Future<void> didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    if (route.settings.name != null) {
      _log.info('${route.settings.name}_screen opened');
    }
  }
}
