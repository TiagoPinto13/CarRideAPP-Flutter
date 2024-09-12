import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_style.dart';

class CarpoolInputText extends StatelessWidget {
  final String hintText;
  final bool isDarkMode;
  final TextEditingController controller;
  final FocusNode focusNode;

  const CarpoolInputText({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isDarkMode,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: isDarkMode ? AppColors.secondColor : Colors.white),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          fillColor: isDarkMode ? AppColors.secondColor : Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.ninthColor,
          ),
        ),
        style: const TextStyle(
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.tenthColor,
        ),
      ),
    );
  }
}
