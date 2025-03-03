part of 'app.dart';

ThemeData _getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: App.appTheme.app_backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: App.appTheme.app_primaryColor,
      // brightness: isDarkMode ? Brightness.dark : Brightness.light,
    ),
    primaryColor: App.appTheme.app_primaryColor,
    useMaterial3: true,
    dividerTheme: DividerThemeData(color: App.appTheme.app_ghostColor, space: 0),
    primaryTextTheme: App.appTheme.textTheme,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: App.appTheme.textTheme.bodyMedium!.copyWith(
        color: App.appTheme.app_textColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: App.appTheme.app_appBarTextColor,
      backgroundColor: App.appTheme.app_appBarColor,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: App.appTheme.textTheme.titleLarge!.copyWith(
        color: App.appTheme.app_appBarTextColor,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: App.appTheme.app_backgroundColor,
      surfaceTintColor: Colors.transparent,
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected)
                ? App.appTheme.primaryColor
                : App.appTheme.app_backgroundColor,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return App.appTheme.app_iconColor; // Active color when selected
        }
        return App.appTheme.app_buttonColor; // Default color when not selected
      }),
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

  TextStyle get app_dialogActionText =>
      labelMedium!.copyWith(color: App.appTheme.app_textColorBlack);

  TextStyle get app_bodyMediumBold => bodyMedium!.copyWith(fontWeight: FontWeight.bold);

  TextStyle get app_bodyLargeBold => bodyLarge!.copyWith(fontWeight: FontWeight.bold);

  TextStyle get bodyXLarge =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: App.appTheme.app_textColor);
}

// custom colors
extension CustomColors on ThemeData {
  //
  // ignore_for_file: non_constant_identifier_names
  Color get app_appBarColor => Colors.transparent;

  Color get app_appBarTextColor => app_textColor;

  Color get app_backgroundColor =>
      App.isDarkMode ? app_backgroundColorDark : app_backgroundColorLight;

  Color get app_backgroundColorDark => const Color(0xff424242);

  Color get app_backgroundColorLight => app_whiteColor;

  Color get app_AppBarGradientColorLight => app_backgroundColorDark;

  Color get app_AppBarGradientColorDark => const Color(0xff272727);

  Color get app_blueLinkColor => const Color(0xFF007AFF); // iOS system blue color
  Color get app_errorColor => app_redColor;

  Color get app_ghostColor => App.isDarkMode ? Colors.grey[700]! : const Color(0xFFD9D9D9);

  Color get app_inactiveColor => Colors.grey[400]!;

  Color get app_tileColor => App.isDarkMode ? const Color(0xFF585858) : Colors.grey[200]!;

  Color get app_iconColor => app_goldColor;

  Color get app_primaryColor => app_yellowColor;

  Color get app_successColor => app_greenColor;

  Color get app_textColor => App.isDarkMode ? app_textColorWhite : app_textColorBlack;

  Color get app_textColorBlack => app_blackColor;

  Color get app_textColorWhite => app_whiteColor;

  Color get app_buttonColor => app_shadow300Color;

  Color get app_driverActionColorBlue => app_blueColor;

  Color get app_driverActionColorYellow => app_yellowColor;

  Color get app_driverActionColorRed => app_redColor;

  Color get app_splashColor =>
      App.isDarkMode ? Colors.grey[500]!.withAlpha(100) : Colors.grey[200]!.withAlpha(100);

  Color get app_shadow100Color =>
      App.isDarkMode ? const Color(0xFF575757) : const Color(0xFFEFEEEE);

  Color get app_shadow200Color =>
      App.isDarkMode ? const Color(0xFF424242) : const Color(0xFF9B9B9B);

  Color get app_shadow300Color =>
      App.isDarkMode ? const Color(0xFF9B9B9B) : const Color(0xFF515151);

  Color get app_blueColor => const Color(0xff6ABBDE);

  Color get app_yellowColor => const Color(0xffF9D749);

  Color get app_redColor => const Color(0xffF04747);

  Color get app_goldColor => const Color(0xffB49100);

  Color get app_greenColor => const Color(0xff1AA620);

  Color get app_softBlueColor => const Color(0xffC4E0EC);

  Color get app_softYellowColor => const Color(0xffFFF1B9);

  Color get app_blackColor => const Color(0xff000000);

  Color get app_whiteColor => const Color(0xffFFFFFF);
}
