import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex_app_test/core/helper/app_image_assets.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/core/theming/test_styles.dart';
import 'package:otex_app_test/features/plans_screen/ui/widget/package_card.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(Assets.chevronRight),
            ),
            Text(
              'أختر الباقات اللى تناسبك',
              style: TextStyles.font24BlackMedium500,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
              style: TextStyles.font14BlackRegular400.copyWith(
                color: ColorsManager.deepNavy50,
              ),
            ),
            SizedBox(height: height * 0.03),
            PackageCard(price: '3000', title: 'أساسية'),
          ],
        ),
      ),
    );
  }
}
