import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otex_app_test/core/theming/colors_manager.dart';
import 'package:otex_app_test/features/layout/ui/user_home_view.dart';

class OtexApp extends StatelessWidget {
  const OtexApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Otex',
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: GoogleFonts.tajawal().fontFamily,
        scaffoldBackgroundColor: ColorsManager.white,
      ),

      home: const UserHomeView(),
    );
  }
}
