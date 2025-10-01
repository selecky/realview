// AAATAXI

// part of 'app.dart';
//
// final _appErrorHandlerLog = Logger('app_error_handler');
//
// void _configureErrorHandling() {
//   FlutterError.onError = (errorDetails) {
//     handleError(error: errorDetails.exception, stackTrace: errorDetails.stack, isFatal: true);
//   };
//   PlatformDispatcher.instance.onError = (error, stackTrace) {
//     handleError(error: error, stackTrace: stackTrace, isFatal: true);
//     return true;
//   };
// }
//
// void handleError({
//   required Object error,
//   required StackTrace? stackTrace,
//   required bool isFatal,
// }) {
//   if (!kReleaseMode) {
//     FlutterError.dumpErrorToConsole(
//       FlutterErrorDetails(exception: error, stack: stackTrace),
//       forceReport: true,
//     );
//   } else {
//     if (isFatal) {
//       _appErrorHandlerLog.severe(error.runtimeType.toString(), error, stackTrace);
//       FirebaseCrashlytics.instance.recordFlutterFatalError(FlutterErrorDetails(exception: error, stack: stackTrace));
//     } else {
//       _appErrorHandlerLog.warning(error.runtimeType.toString(), error, stackTrace);
//       FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
//     }
//     FirebaseCrashlytics.instance.log(App.logsQueue.join('   ___   '));
//   }
// }




// CHARGEE

// void configureErrorHandling() {
//   FlutterError.onError = (errorDetails) {
//     if (!kReleaseMode) {
//       FlutterError.dumpErrorToConsole(errorDetails, forceReport: true);
//     } else {
//       // Pass all uncaught "fatal" errors from the framework to Crashlytics
//       FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//       FirebaseCrashlytics.instance.log(App.logsQueue.join('   ___   '));
//     }
//   };
//   // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
//   PlatformDispatcher.instance.onError = (error, stack) {
//     if (!kReleaseMode) {
//       FlutterError.dumpErrorToConsole(FlutterErrorDetails(exception: error, stack: stack), forceReport: true);
//     } else {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//       FirebaseCrashlytics.instance.log(App.logsQueue.join('   ___   '));
//     }
//     return true;
//   };
// }
