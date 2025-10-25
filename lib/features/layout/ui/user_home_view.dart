import 'package:flutter/material.dart';
import 'package:otex_app_test/core/helper/app_image_assets.dart';
import 'package:otex_app_test/core/routing/app_router.dart';
import 'package:otex_app_test/features/home/ui/home_screen.dart';
import 'package:otex_app_test/features/layout/ui/widgets/bottom_nav_item.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('Chat Page')),
    const Center(child: Text('Add Page')),
    const Center(child: Text('My Ads Page')),
    const Center(child: Text('Profile Page')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                index: 0,
                iconPath: Assets.homeIcon,
                label: 'الرئيسية',
                isActive: _currentIndex == 0,
                onTap: () {
                  _currentIndex = 0;
                  setState(() {});
                },
              ),
              BottomNavItem(
                index: 1,
                iconPath: Assets.chatIcon,
                label: 'محادثة',
                isActive: _currentIndex == 1,
                onTap: () {
                  _currentIndex = 1;
                  setState(() {});
                },
              ),
              BottomNavItem(
                index: 2,
                iconPath: Assets.addIcon,
                label: 'أضف إعلان',
                isActive: false,
                isSpecial: true,
                onTap: () {
                  _currentIndex = 2;
                  setState(() {});
                },
              ),
              BottomNavItem(
                index: 3,
                iconPath: Assets.myAdsIcon,
                label: 'إعلاناتي',
                isActive: _currentIndex == 3,
                onTap: () {
                  _currentIndex = 3;
                  setState(() {});
                },
              ),
              BottomNavItem(
                index: 4,
                iconPath: Assets.profileIcon,
                label: 'حسابي',
                isActive: false,
                onTap: () {
                  AppRouter.goToPlansScreen(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
