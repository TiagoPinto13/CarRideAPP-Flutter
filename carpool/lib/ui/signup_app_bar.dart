import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/theme/app_style.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback? onBackTap;
  final double? height;

  const SignUpAppBar({
    Key? key,
    required this.title,
    required this.isDarkMode,
    required this.onBackTap,
    this.height,
  }) : super(key: key);


  @override
Widget build(BuildContext context) {
  final TextStyle titleStyle =
      isDarkMode ? AppStyle.h1Dark : AppStyle.h1Light;

  final Color backgroundColor =
      isDarkMode ? AppColors.tenthColor : AppColors.fifthColor;

  final Color iconColor = isDarkMode ? Colors.white : AppColors.ninthColor;

  return AppBar(
    backgroundColor: backgroundColor,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, size: 30),
      color: iconColor,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    titleSpacing: -15, 
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringsManager.instance.getString(context, signup_page_back_button),
          style: isDarkMode ? AppStyle.h1Dark : AppStyle.h1Light
        ),
        const SizedBox(width: 8),
      ],
    ),
  );
}

  @override
  Size get preferredSize {
    final double appBarHeight = height ?? kToolbarHeight;
    return Size.fromHeight(appBarHeight);
  }
}
