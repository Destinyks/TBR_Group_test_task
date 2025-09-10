import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.accentGreen,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.grey),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardColor: AppColors.darkGrey,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accentGreen,
      secondary: AppColors.grey,
    ),
  );
}
