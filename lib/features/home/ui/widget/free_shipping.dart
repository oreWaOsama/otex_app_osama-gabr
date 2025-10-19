import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otex_app_test/core/helper/app_image_assets.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/core/theming/test_styles.dart';

class FreeShipping extends StatelessWidget {
  const FreeShipping({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: height * 0.005),
      width: double.infinity,
      height: height * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorsManager.vividOrangeTransparent,
      ),
      child: Row(
        children: [
          SvgPicture.asset(Assets.check),
          SizedBox(width: width * 0.02),
          Text(
            'شحن مجانى',
            style: TextStyles.font12BlackRegular400.copyWith(
              color: ColorsManager.textPrimaryColor,
            ),
          ),
          Spacer(),
          Text(
            'لأى عرض تطلبه دلوقتى !',
            style: TextStyles.font10BlackRegular400,
          ),
        ],
      ),
    );
  }
}
