import 'package:flutter/material.dart';

class AppColors {
  static const Color firstColor = Color(0xFFFFFFFF);
  static const Color secondColor = Color(0xFFC6E1F3);
  static const Color thirdColor = Color(0xFFA5CFED);
  static const Color fourthColor = Color(0xFF7DB9E5);
  static const Color fifthColor = Color(0xFF4A9EDA);
  static const Color sixthColor = Color(0xFF0077CC);
  static const Color seventhColor = Color(0xFF006BB7);
  static const Color eighthColor = Color(0xFF005DA0);
  static const Color ninthColor = Color(0xFF004D84);
  static const Color tenthColor = Color(0xFF00365D);

  // Light Mode UI colors
  static Color get primaryButton => fifthColor;
  static Color get secondaryButton => fifthColor;
  static Color get background => firstColor;
  static Color get textColor => eighthColor;
  static Color get primaryButtonText => Colors.white;
  static Color get secondaryButtonText => tenthColor;
  static Color get titleColor => tenthColor;
  static Color get appBarColor => firstColor;
  static Color get primaryIcon => eighthColor;
  static Color get secondaryIcon => sixthColor;

  // Dark Mode UI colors
  static Color get primaryButtonDark => tenthColor;
  static Color get secondaryButtonDark => ninthColor;
  static Color get backgroundDark => fifthColor;
  static Color get textColorDark => firstColor;
  static Color get primaryButtonTextDark => firstColor;
  static Color get secondaryButtonTextDark => thirdColor;
  static Color get titleColorDark => firstColor;
  static Color get appBarColorDark => tenthColor;
  static Color get primaryIconDark => firstColor;
  static Color get secondaryIconDark => firstColor;
}
