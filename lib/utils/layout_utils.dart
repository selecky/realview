import 'package:flutter/material.dart';

enum LayoutType { mobile, tablet, desktop }

class LayoutUtils {
  // Breakpoints based on shortestSide of the screen
  static LayoutType getLayoutType(BuildContext context) {
    final double shortestSide = MediaQuery.sizeOf(context).shortestSide;

    if (shortestSide < 600) {
      return LayoutType.mobile;
    } else if (shortestSide < 1024) {
      return LayoutType.tablet;
    } else {
      return LayoutType.desktop;
    }
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.orientationOf(context) == Orientation.landscape;
  }

  static bool isLayoutMobile(BuildContext context) => getLayoutType(context) == LayoutType.mobile;

  static bool isLayoutTablet(BuildContext context) => getLayoutType(context) == LayoutType.tablet;

  static bool isLayoutDesktop(BuildContext context) => getLayoutType(context) == LayoutType.desktop;
}
