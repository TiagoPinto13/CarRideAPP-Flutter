import 'package:carpool/theme/app_style.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum ButtonTextSize { high, medium, small }

class CarpoolButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool enabled;
  final Widget? leading;
  final Widget? trailingWidget;
  final Color backgroundColor;
  final Color borderColor;
  final TextStyle textStyle;
  final double borderRadius;
  final double height;
  final double width;
  final ButtonTextSize textSize;

  const CarpoolButton({
    super.key,
    required this.title,
    required this.onTap,
    this.enabled = true,
    this.leading,
    this.trailingWidget,
    required this.backgroundColor,
    required this.textStyle,
    required this.borderColor,
    this.borderRadius = 16,
    this.height = 36,
    this.width = 12,
    this.textSize = ButtonTextSize.medium,
  });

  static TextStyle _get_current_text_style(
      ButtonTextSize textSize, bool isDarkMode) {
    switch (textSize) {
      case ButtonTextSize.high:
        return isDarkMode
            ? AppStyle.primaryButtonDarkHigh
            : AppStyle.primaryButtonLightHigh;
      case ButtonTextSize.medium:
        return isDarkMode
            ? AppStyle.primaryButtonDarkMedium
            : AppStyle.primaryButtonLightMedium;
      case ButtonTextSize.small:
        return isDarkMode
            ? AppStyle.primaryButtonDarkSmall
            : AppStyle.primaryButtonLightSmall;
    }
  }

  static TextStyle _get_inverted_current_text_style(
      ButtonTextSize textSize, bool isDarkMode) {
    switch (textSize) {
      case ButtonTextSize.high:
        return isDarkMode
            ? AppStyle.invertedPrimaryButtonDarkHigh
            : AppStyle.invertedPrimaryButtonLightHigh;
      case ButtonTextSize.medium:
        return isDarkMode
            ? AppStyle.primaryButtonDarkMedium
            : AppStyle.invertedPrimaryButtonLightMedium;
      case ButtonTextSize.small:
        return isDarkMode
            ? AppStyle.primaryButtonDarkSmall
            : AppStyle.invertedPrimaryButtonLightSmall;
    }
  }

  factory CarpoolButton.primary({
    required String title,
    required VoidCallback onTap,
    bool enabled = true,
    bool isDarkMode = false,
    Widget? leading,
    Widget? trailingWidget,
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = 16,
    double height = 36,
    double width = 12,
    ButtonTextSize textSize = ButtonTextSize.medium,
  }) {
    TextStyle textStyle = _get_current_text_style(textSize, isDarkMode);

    return CarpoolButton(
      title: title,
      enabled: enabled,
      leading: leading,
      borderColor: isDarkMode
          ? AppColors.secondaryButtonDark
          : AppColors.secondaryButton,
      backgroundColor:
          isDarkMode ? AppColors.primaryButtonDark : AppColors.primaryButton,
      trailingWidget: trailingWidget,
      textStyle: textStyle,
      onTap: onTap,
      height: height,
      width: width,
      borderRadius: borderRadius,
    );
  }

  factory CarpoolButton.secondary({
    required String title,
    required VoidCallback onTap,
    bool enabled = true,
    bool isDarkMode = false,
    Widget? leading,
    Widget? trailingWidget,
    TextStyle? textStyle,
    Color? borderColor,
    Color? backgroundColor,
    double borderRadius = 16,
    double height = 36,
    double width = 12,
    ButtonTextSize textSize = ButtonTextSize.medium,
  }) {
    TextStyle textStyle = _get_current_text_style(textSize, isDarkMode);

    return CarpoolButton(
      title: title,
      enabled: enabled,
      textStyle: textStyle,
      borderColor: isDarkMode
          ? AppColors.secondaryButtonDark
          : AppColors.secondaryButton,
      backgroundColor: isDarkMode
          ? AppColors.secondaryButtonDark
          : AppColors.secondaryButton,
      leading: leading,
      trailingWidget: trailingWidget,
      onTap: onTap,
      height: height,
      width: width,
      borderRadius: borderRadius,
    );
  }

  factory CarpoolButton.third({
    required String title,
    required VoidCallback onTap,
    bool enabled = true,
    bool isDarkMode = false,
    Widget? leading,
    Widget? trailingWidget,
    Color? borderColor,
    TextStyle? textStyle,
    Color? backgroundColor,
    double borderRadius = 16,
    double height = 36,
    double width = 12,
    ButtonTextSize textSize = ButtonTextSize.medium,
  }) {
    TextStyle textStyle =
        _get_inverted_current_text_style(textSize, isDarkMode);

    return CarpoolButton(
      title: title,
      enabled: enabled,
      leading: leading,
      borderColor: isDarkMode
          ? AppColors.secondaryButtonDark
          : AppColors.secondaryButton,
      backgroundColor: isDarkMode ? AppColors.secondColor : AppColors.secondColor,
      trailingWidget: trailingWidget,
      textStyle: textStyle,
      onTap: onTap,
      height: height,
      width: width,
      borderRadius: borderRadius,
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RawMaterialButton(
        fillColor: backgroundColor,
        onPressed: enabled ? onTap : null,
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            leading ?? const SizedBox(),
            leading != null ? const SizedBox(width: 4) : const SizedBox(),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                title,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ),
            trailingWidget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

}
