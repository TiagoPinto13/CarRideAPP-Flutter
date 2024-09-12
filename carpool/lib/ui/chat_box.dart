import 'package:carpool/theme/app_style.dart';
import 'package:flutter/cupertino.dart';

import '../theme/app_colors.dart';

class ChatBox extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBox(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: isCurrentUser ? AppColors.thirdColor : AppColors.fourthColor,
          borderRadius: isCurrentUser? const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12), bottomLeft: Radius.circular(12)) : const BorderRadius.only(topLeft: const Radius.circular(12), topRight: const Radius.circular(12), bottomRight: const Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(message, style: AppStyle.h2Light),);
  }
}
