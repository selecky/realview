import 'dart:io';

import 'package:flutter/foundation.dart';

// to determine Platform
bool get isMobile => Platform.isAndroid || Platform.isIOS;
bool get isDesktop => Platform.isLinux || Platform.isMacOS || Platform.isWindows;
bool get isWeb => kIsWeb;
