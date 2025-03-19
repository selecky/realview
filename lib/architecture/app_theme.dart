part of 'app.dart';

ThemeData _getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: App.appTheme.app_backgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: App.appTheme.app_primaryColor),
    primaryColor: App.appTheme.app_primaryColor,
    useMaterial3: true,
    dividerTheme: DividerThemeData(color: App.appTheme.app_dividerColor, space: 0),
    primaryTextTheme: App.appTheme.textTheme,
    appBarTheme: AppBarTheme(
      foregroundColor: App.appTheme.app_textColor,
      backgroundColor: App.appTheme.app_appBarColor,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: App.appTheme.textTheme.titleLarge!.copyWith(
        color: App.appTheme.app_textColor,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
      displayMedium: TextStyle(
        fontSize: 52,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
      displaySmall: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: App.appTheme.app_textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: App.appTheme.app_textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: App.appTheme.app_textColor,
      ),
      bodyLarge: TextStyle(fontSize: 18, color: App.appTheme.app_textColor),
      bodyMedium: TextStyle(fontSize: 16, color: App.appTheme.app_textColor),
      bodySmall: TextStyle(fontSize: 14, color: App.appTheme.app_textColor),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: App.appTheme.app_textColor,
      ),
    ),
  );
}

// custom text styles
extension CustomTextStyles on TextTheme {
  TextStyle get app_bodyMediumBlack => bodyMedium!.copyWith(color: App.appTheme.app_textColorBlack);
  TextStyle get app_bodyMediumWhite => bodyMedium!.copyWith(color: App.appTheme.app_textColorWhite);
  TextStyle get app_bodyMediumGrey => bodyMedium!.copyWith(color: App.appTheme.app_textColorGrey);
}

// custom colors
extension CustomColors on ThemeData {
  // ignore_for_file: non_constant_identifier_names
  Color get app_appBarColor => App.isDarkMode ? Colors.black54 : app_primaryColor;

  Color get app_backgroundColor =>
      App.isDarkMode ? app_backgroundColorDark : app_backgroundColorLight;

  Color get app_backgroundColorDark => const Color(0xff424242);

  Color get app_backgroundColorLight => Colors.white;

  Color get app_dividerColor => App.isDarkMode ? Colors.grey[700]! : const Color(0xFFD9D9D9);

  Color get app_primaryColor => App.isDarkMode ? Colors.black54 : Colors.yellow;

  Color get app_textColor => App.isDarkMode ? app_textColorWhite : app_textColorBlack;

  Color get app_textColorBlack => Colors.black;

  Color get app_textColorWhite => Colors.white;

  Color get app_textColorGrey => App.isDarkMode ? Colors.grey[400]! : Colors.grey[800]!;

  Color get app_tileColor => App.isDarkMode ? const Color(0xFF585858) : Colors.grey[200]!;

  Color get app_redColor => App.isDarkMode ? Colors.red[400]! : Colors.red;
}
