part of 'app.dart';

void _configureLogger() {
  Logger.root.level = kReleaseMode ? Level.INFO : Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      final message =
          '[${record.level.name}] ${record.loggerName}: ${record.message} '
          '-- Time: ${record.time}'
          '${record.error != null ? '\nError: ${record.error}' : ''}'
          '${record.stackTrace != null ? '\nStackTrace: ${record.stackTrace}' : ''}';
      developer.log(message);
    }
    // store last 100 logs (to send to crashlytics on error)
    App.logsQueue.addFirst(
      '${record.time} [${record.level.name}]'
      ' ${record.loggerName}: ${record.message}',
    );
    while (App.logsQueue.length > 100) {
      App.logsQueue.removeLast();
    }
  });
}
