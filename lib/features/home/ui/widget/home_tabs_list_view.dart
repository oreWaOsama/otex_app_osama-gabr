import 'package:flutter/material.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/core/theming/test_styles.dart';
import 'package:otex_app_test/features/home/ui/widget/home_tabs_item.dart';

class HomeTabsListView extends StatelessWidget {
  const HomeTabsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    List<String> categorriesNames = [
      'كل العروض',
      'ملابس',
      'أكسسوارات',
      'الكترونيات',
      'منتجات تجميل',
      'عقارات',
    ];
    return SizedBox(
      height: height * 0.05,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return HomeTabsItem(
            categorriesNames: categorriesNames[index],
            isSelected: index == 0,
            selectedBackgroundColor: ColorsManager.vividOrangeTransparent,
            selectedTextStyle: TextStyles.font16BlackMedium500.copyWith(
              color: ColorsManager.primary,
            ),
            unselectedTextStyle: TextStyles.font14BlackMedium500.copyWith(
              color: ColorsManager.deepNavy50,
            ),
            borderColor: ColorsManager.royalBlue10,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: categorriesNames.length,
      ),
    );
  }
}
