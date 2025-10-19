import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex_app_test/core/helper/app_image_assets.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/core/theming/test_styles.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.41,
      width: width * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: ColorsManager.black10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: height * 0.25,
            decoration: BoxDecoration(
              color: ColorsManager.black5,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Image.asset(Assets.hodee),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'جاكيت من الصوف مناسب',
                          style: TextStyles.font14BlackMedium500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SvgPicture.asset(Assets.bxsOffer, width: 24, height: 24),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '32,000,000جم/',
                              style: TextStyles.font14BlackMedium500.copyWith(
                                color: ColorsManager.primary,
                              ),
                            ),
                            TextSpan(
                              text: '60,000,000',
                              style: TextStyles.font14BlackMedium500.copyWith(
                                color: ColorsManager.primary,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.favoriteIcon,
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.localFireDepartment,
                      width: 12,
                      height: 12,
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      'تم بيع 3.3k+',
                      style: TextStyles.font10BlackRegular400.copyWith(
                        color: ColorsManager.deepNavy50,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.025),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.companyBadge,
                      width: 26,
                      height: 26,
                    ),
                    Spacer(),
                    Container(
                      height: height * 0.028,
                      width: width * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: ColorsManager.black10),
                      ),
                      child: SvgPicture.asset(
                        Assets.addShopping,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    SizedBox(width: width * 0.01),
                    SvgPicture.asset(Assets.mostaLogo, width: 60, height: 26),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
