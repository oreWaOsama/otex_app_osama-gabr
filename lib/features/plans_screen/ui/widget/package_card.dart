// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:otex_app_test/core/helper/app_image_assets.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/core/theming/test_styles.dart';

class PackageCard extends StatelessWidget {
  final bool isSelected;
  final String price;
  final String title;
  const PackageCard({
    super.key,
    this.isSelected = false,
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorsManager.black10),
        color: ColorsManager.white,
        boxShadow: [
          const BoxShadow(
            color: ColorsManager.black10,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.inactiveCheckBox),
              SizedBox(width: width * 0.01),
              Text(title, style: TextStyles.font16BlackBold700),
              Spacer(),

              Stack(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: price,
                          style: TextStyles.font16BlackBold700.copyWith(
                            fontFamily: GoogleFonts.tajawal().fontFamily,
                            color: ColorsManager.primary,
                          ),
                        ),
                        TextSpan(
                          text: ' ج',
                          style: TextStyles.font16BlackBold700.copyWith(
                            fontFamily: GoogleFonts.tajawal().fontFamily,
                            color: ColorsManager.primary,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyles.font16BlackBold700.copyWith(
                            fontFamily: GoogleFonts.tajawal().fontFamily,
                            color: ColorsManager.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'م',
                          style: TextStyles.font16BlackBold700.copyWith(
                            fontFamily: GoogleFonts.tajawal().fontFamily,
                            color: ColorsManager.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: -6,
                    right: -8,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 2,
                            color: ColorsManager.primary,
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 2,
                            color: ColorsManager.primary,
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: ColorsManager.black10,
            thickness: 1,
            height: height * 0.03,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PackageFeature(
                    icon: Assets.acute,
                    title: 'صلاحية الأعلان 30 يوم',
                  ),
                  SizedBox(height: height * 0.01),
                  PackageFeature(
                    icon: Assets.acute,
                    title: 'تثبيت فى مقاول صحى',
                    subtitle: '( خلال ال48 ساعة القادمة )',
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    width: width * 0.18,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: ColorsManager.opaqueMyColor.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        topLeft: Radius.circular(32),
                      ),
                      border: Border(
                        top: BorderSide(color: ColorsManager.primary),
                        right: BorderSide(color: ColorsManager.primary),
                        left: BorderSide(color: ColorsManager.primary),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '7',
                        style: TextStyles.font14BlackBold700.copyWith(
                          color: ColorsManager.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'ضعف عدد\nالمشاهدات',
                    textAlign: TextAlign.center,
                    style: TextStyles.font12BlackRegular400.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PackageFeature extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String icon;
  const PackageFeature({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        SizedBox(width: 24, height: 24, child: SvgPicture.asset(icon)),
        subtitle != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    subtitle ?? '',
                    style: TextStyles.font14BlackMedium500.copyWith(
                      color: ColorsManager.priceColor,
                    ),
                  ),
                ],
              )
            : Text(title, style: TextStyles.font14BlackMedium500),
      ],
    );
  }
}
