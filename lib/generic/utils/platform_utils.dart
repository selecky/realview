import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformUtils {
  // to determine Platform
  static bool get isPlatformMobile => Platform.isAndroid || Platform.isIOS;
  static bool get isPlatformDesktop => Platform.isLinux || Platform.isMacOS || Platform.isWindows;
  static bool get isPlatformWeb => kIsWeb;
}
