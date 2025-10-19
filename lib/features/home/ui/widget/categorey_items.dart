import 'package:flutter/material.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/core/theming/test_styles.dart';

class CategoreyItems extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoreyItems({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      spacing: height * 0.01,
      children: [
        Container(
          height: height * 0.070,
          width: width * 0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorsManager.black10,
          ),
          child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
        ),
        Text(
          title,
          style: TextStyles.font12BlackRegular400.copyWith(
            color: ColorsManager.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}
