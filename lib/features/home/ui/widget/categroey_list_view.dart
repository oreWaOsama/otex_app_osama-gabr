import 'package:flutter/material.dart';
import 'package:otex_app_test/core/helper/app_image_assets.dart';
import 'package:otex_app_test/features/home/ui/widget/categorey_items.dart';

class CategroeyListView extends StatelessWidget {
  const CategroeyListView({super.key});

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
     List<Widget> categoreyItems = [
      CategoreyItems(title: 'موضة رجالى', imagePath: Assets.man),
      CategoreyItems(title: 'ساعات', imagePath: Assets.watch),
      CategoreyItems(title: 'موبايلات', imagePath: Assets.iPhone),
      CategoreyItems(title: 'منتجات تجميل', imagePath: Assets.makeUp),
      CategoreyItems(title: 'فلل', imagePath: Assets.villa),
    ];

    return  SizedBox(
              height: height * 0.1,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return categoreyItems[index];
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: categoreyItems.length,
              ),
            );
  }
}