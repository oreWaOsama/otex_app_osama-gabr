import 'package:flutter/material.dart';
import 'package:otex_app_test/features/plans_screen/ui/plans_screen.dart';

class AppRouter {
  AppRouter._();

   static goToPlansScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PlansScreen()),
    );
  }

}