import 'package:flutter/material.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';

class HomeTabsItem extends StatelessWidget {
  final String categorriesNames;
  final bool isSelected;
  final Color selectedBackgroundColor;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;
  final Color? borderColor;
  const HomeTabsItem({
    super.key,

    required this.categorriesNames,
    required this.isSelected,
    required this.selectedBackgroundColor,
    this.borderColor,
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      decoration: BoxDecoration(
        color: isSelected
            ? selectedBackgroundColor
            : ColorsManager.transparentColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? ColorsManager.royalBlue10 : ColorsManager.black10,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          categorriesNames,
          style: isSelected ? selectedTextStyle : unselectedTextStyle,
        ),
      ),
    );
  }
}
