import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/core/theming/test_styles.dart';

class BottomNavItem extends StatelessWidget {
  final int index;
  final String iconPath;
  final String label;
  final bool isActive;
  final bool isSpecial;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.index,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.isSpecial = false,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    Color textColor;
    Color shadowColor = ColorsManager.gery;

    if (isSpecial) {
      iconColor = ColorsManager.royalBlue;
      textColor = ColorsManager.royalBlue;
      shadowColor = ColorsManager.white;
    } else if (isActive) {
      iconColor = ColorsManager.myBlack;
      textColor = ColorsManager.myBlack;
      shadowColor = ColorsManager.textPrimaryColor;
    } else {
      iconColor = ColorsManager.gery;
      textColor = ColorsManager.gery;
      shadowColor = ColorsManager.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: shadowColor, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(iconPath, color: iconColor, width: 24, height: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyles.font12BlackMedium500.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
