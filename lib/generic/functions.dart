import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:realview/generic/responsive_utils.dart';

// to determine Platform
bool get isPlatformMobile => Platform.isAndroid || Platform.isIOS;
bool get isPlatformDesktop => Platform.isLinux || Platform.isMacOS || Platform.isWindows;
bool get isPlatformWeb => kIsWeb;

// to determine Layout
bool isLayoutMobile ({required BuildContext context}) => ResponsiveUtils.isMobile(context);
bool isLayoutTablet ({required BuildContext context}) => ResponsiveUtils.isTablet(context);
bool isLayoutDesktop ({required BuildContext context}) => ResponsiveUtils.isDesktop(context);