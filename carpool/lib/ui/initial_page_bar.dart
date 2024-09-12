import 'package:carpool/theme/app_colors.dart';
import 'package:flutter/material.dart';

class InitialAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final double? height;

  const InitialAppBar({
    super.key,
    required this.isDarkMode,
    this.height,
  });

  @override
  @override
Widget build(BuildContext context) {
  final Color backgroundColor =
      isDarkMode ? AppColors.appBarColorDark : AppColors.appBarColor;

  return AppBar(
    backgroundColor: backgroundColor, 
  );
}

  @override
  Size get preferredSize {
    final double appBarHeight = height ?? kToolbarHeight;
    return Size.fromHeight(appBarHeight);
  }
}
