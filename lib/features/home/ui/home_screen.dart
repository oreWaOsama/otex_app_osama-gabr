import 'package:flutter/material.dart';
import 'package:otex_app_test/features/home/ui/widget/ad_card.dart';
import 'package:otex_app_test/features/home/ui/widget/categroey_list_view.dart';
import 'package:otex_app_test/features/home/ui/widget/free_shipping.dart';
import 'package:otex_app_test/features/home/ui/widget/home_app_bar.dart';
import 'package:otex_app_test/features/home/ui/widget/home_tabs_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: HomeAppBar.appBar(context),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: HomeTabsListView(),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: height * 0.015),
                      const CategroeyListView(),
                      SizedBox(height: height * 0.035),
                      const FreeShipping(),
                      SizedBox(height: height * 0.01),
                    ]),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            width: constraints.maxWidth,
                            child: const AdCard(),
                          );
                        },
                      ),
                      childCount: 10,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.49,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 16,
                        ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
