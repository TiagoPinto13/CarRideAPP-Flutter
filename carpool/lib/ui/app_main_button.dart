import 'package:carpool/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'dart:math' as math;

import '../theme/app_colors.dart';

class HexagonalButton extends StatelessWidget {
  final double size;
  final Color color;
  final VoidCallback onPressed;
  final Color iconColor;

  const HexagonalButton({
    super.key,
    required this.size,
    required this.color,
    required this.onPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: HexagonWidget.pointy(
            width: size,
            color: color,
            child: Icon(
              Icons.search,
              color: iconColor,
            )));
  }

  factory HexagonalButton.primary({
    required VoidCallback onPressed,
  }) {
    return HexagonalButton(
      size: 80,
      color: AppColors.primaryButton,
      iconColor: AppColors.textColor,
      onPressed: onPressed,
    );
  }

  factory HexagonalButton.primaryDark({
    required VoidCallback onPressed,
  }) {
    return HexagonalButton(
      size: 80,
      color: AppColors.primaryButtonDark,
      iconColor: AppColors.textColorDark,
      onPressed: onPressed,
    );
  }
}

class _HexagonalButtonPainter extends CustomPainter {
  final Color color;

  _HexagonalButtonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    double halfWidth = size.width / 2;
    double halfHeight = size.height / 2;

    Path path = Path();
    path.moveTo(0, halfHeight * 0.5);
    path.lineTo(halfWidth * 0.25, 0);
    path.lineTo(halfWidth * 0.75, 0);
    path.lineTo(size.width, halfHeight * 0.5);
    path.lineTo(halfWidth * 0.75, size.height);
    path.lineTo(halfWidth * 0.25, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
