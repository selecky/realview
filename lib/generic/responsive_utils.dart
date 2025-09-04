import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class ResponsiveUtils {
  // Breakpoints based on shortestSide of the screen
  static DeviceType getDeviceType(BuildContext context) {
    final double shortestSide = MediaQuery.sizeOf(context).shortestSide;

    if (shortestSide < 600) {
      return DeviceType.mobile;
    } else if (shortestSide < 1024) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;
}
