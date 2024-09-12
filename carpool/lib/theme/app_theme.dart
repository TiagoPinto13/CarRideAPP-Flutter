
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData _themeData = ThemeData(
    fontFamily: 'Mulish',

    primaryColor: AppColors.secondColor,
    primaryColorLight: AppColors.secondColor,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.textColor, 
      selectionColor: AppColors.fifthColor.withOpacity(0.2),
    ),

    colorScheme: ColorScheme(
      primary: AppColors.primaryButton,
      onPrimary: AppColors.textColor,
      secondary: AppColors.secondaryButton,
      onSecondary: AppColors.textColorDark,
      error: AppColors.ninthColor,
      onError: AppColors.eighthColor,
      onBackground: AppColors.background,
      surface: AppColors.background,
      onSurface: AppColors.textColor,
      background: AppColors.background,
      brightness: Brightness.dark,
    ),
  );

  static themeData(Brightness brightness) => _themeData.copyWith(
        // Brightness
        brightness: brightness,
        colorScheme: _themeData.colorScheme.copyWith(
          brightness: brightness,
          primary: AppColors.primaryButton,
          secondary: AppColors.secondaryButton,
          background: AppColors.background,
          surface: AppColors.primaryButton,
          onSurface: AppColors.secondaryButton,
        ),
      );
}