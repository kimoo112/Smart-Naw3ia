import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTheme {
  static TextTheme _buildTextTheme(TextTheme base, String language) {
    final fontFamily = language == 'ar' ? 'Almarai' : 'Poppins';
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontFamily: fontFamily),
      displayMedium: base.displayMedium?.copyWith(fontFamily: fontFamily),
      displaySmall: base.displaySmall?.copyWith(fontFamily: fontFamily),
      headlineLarge: base.headlineLarge?.copyWith(fontFamily: fontFamily),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: fontFamily),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: fontFamily),
      titleLarge: base.titleLarge?.copyWith(fontFamily: fontFamily),
      titleMedium: base.titleMedium?.copyWith(fontFamily: fontFamily),
      titleSmall: base.titleSmall?.copyWith(fontFamily: fontFamily),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: fontFamily),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: fontFamily),
      bodySmall: base.bodySmall?.copyWith(fontFamily: fontFamily),
      labelLarge: base.labelLarge?.copyWith(fontFamily: fontFamily),
      labelMedium: base.labelMedium?.copyWith(fontFamily: fontFamily),
      labelSmall: base.labelSmall?.copyWith(fontFamily: fontFamily),
    );
  }

  static ThemeData getTheme(Locale locale,
      {Brightness brightness = Brightness.light}) {
    final isDark = brightness == Brightness.dark;
    final language = locale.languageCode;

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor:
          isDark ? AppColors.primaryColorLight : AppColors.primaryColor,
      scaffoldBackgroundColor:
          isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF8F6FF),
      cardColor: isDark ? const Color(0xFF2C2C2C) : Colors.white,
      fontFamily: language == 'ar' ? 'Almarai' : 'Poppins',
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? const Color(0xFF2C2C2C) : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: language == 'ar' ? 'Almarai' : 'Poppins',
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: isDark ? const Color(0xFFFFFFFF) : Colors.black,
          fontFamily: language == 'ar' ? 'Almarai' : 'Poppins',
        ),
        bodyMedium: TextStyle(
          color: isDark ? const Color(0xB3FFFFFF) : Colors.black87,
          fontFamily: language == 'ar' ? 'Almarai' : 'Poppins',
        ),
      ),
      iconTheme: IconThemeData(
        color: isDark ? Colors.white : Colors.black,
      ),
      cardTheme: CardTheme(
        color: isDark ? const Color(0xFF2C2C2C) : Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: brightness,
      ).copyWith(
        surface: isDark ? const Color(0xFF2C2C2C) : Colors.white,
        background: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF8F6FF),
      ),
    );

    return base.copyWith(
      textTheme: _buildTextTheme(base.textTheme, language),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme, language),
    );
  }

  static ThemeData get lightTheme =>
      getTheme(const Locale('ar'), brightness: Brightness.light);
  static ThemeData get darkTheme =>
      getTheme(const Locale('ar'), brightness: Brightness.dark);
}
