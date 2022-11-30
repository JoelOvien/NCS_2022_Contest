import 'package:flutter/material.dart';
import 'package:smart_irrigation/utilities/ui_utilities/text_style_util.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData smTheme = ThemeData(
    primaryColor: AppColors.brandBlue,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.brandBlue,
      onPrimary: AppColors.purple1b,
      secondary: AppColors.brandGreen,
      onSecondary: AppColors.purple1b,
      error: AppColors.errorColor,
      onError: AppColors.white,
      background: AppColors.white,
      onBackground: AppColors.purple1b,
      surface: AppColors.white,
      onSurface: AppColors.purple1b,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: semiBoldStyle(18, AppColors.purple1b),
    ),
  );
}
