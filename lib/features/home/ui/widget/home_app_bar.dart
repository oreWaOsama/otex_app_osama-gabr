import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otex_app_test/core/helper/app_image_assets.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/core/theming/test_styles.dart';

class HomeAppBar {
static  PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    backgroundColor: ColorsManager.white,
    title: Text('أستكشف العروض', style: TextStyles.font16BlackMedium500),
    actions: [
      Row(
        children: [
          Text(
            'الكل',
            style: TextStyles.font16BlackBold700.copyWith(
              color: ColorsManager.grey700,
            ),
          ),
          const SizedBox(width: 4),
          SvgPicture.asset(Assets.arrowBackIcon),
          const SizedBox(width: 16),
        ],
      ),
    ],
  );
}

}