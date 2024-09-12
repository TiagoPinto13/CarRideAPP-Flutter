import 'package:carpool/theme/app_colors.dart';
import 'package:carpool/theme/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CarpoolAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onSettingsTap;
  final Stream<QuerySnapshot>? notificationStream;
  final double? height;

  const CarpoolAppBar({
    super.key,
    this.title = "",
    required this.isDarkMode,
    required this.onNotificationTap,
    required this.onSettingsTap,
    this.height,
    this.notificationStream,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle =
        isDarkMode ? AppStyle.h1Dark : AppStyle.h1Light;

    final Color iconColor =
        isDarkMode ? AppColors.firstColor : AppColors.ninthColor;

    final Color backgroundColor =
        isDarkMode ? AppColors.tenthColor : AppColors.fifthColor;

    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: onSettingsTap,
        color: iconColor,
      ),
      title: Text(
        title,
        style: titleStyle,
      ),
      backgroundColor: backgroundColor,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: onNotificationTap,
              color: iconColor,
            ),
            if (notificationStream != null)
              StreamBuilder<QuerySnapshot>(
                stream: notificationStream,
                builder: (context, snapshot) {
                  return snapshot.hasData && snapshot.data!.docs.isNotEmpty
                      ? Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Text(
                              '${snapshot.data!.docs.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
