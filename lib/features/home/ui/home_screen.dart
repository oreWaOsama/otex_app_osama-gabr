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
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: HomeAppBar.appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTabsListView(),
              SizedBox(height: height * 0.035),
              const CategroeyListView(),
              SizedBox(height: height * 0.035),
              const FreeShipping(),
              SizedBox(height: height * 0.02),
              AdCard(),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:otex_app_test/features/home/ui/widget/ad_card.dart';
// import 'package:otex_app_test/features/home/ui/widget/categroey_list_view.dart';
// import 'package:otex_app_test/features/home/ui/widget/free_shipping.dart';
// import 'package:otex_app_test/features/home/ui/widget/home_app_bar.dart';
// import 'package:otex_app_test/features/home/ui/widget/home_tabs_list_view.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: HomeAppBar.appBar(context),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HomeTabsListView(),
//             Expanded(
//               child: NestedScrollView(
//                 headerSliverBuilder: (context, innerBoxIsScrolled) => [
//                   SliverToBoxAdapter(child: SizedBox(height: height * 0.035)),
//                   const SliverToBoxAdapter(child: CategroeyListView()),
//                   SliverToBoxAdapter(child: SizedBox(height: height * 0.035)),
//                   const SliverToBoxAdapter(child: FreeShipping()),
//                   SliverToBoxAdapter(child: SizedBox(height: height * 0.02)),
//                 ],
//                 body: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.8,
//                     mainAxisSpacing: 250,
//                     crossAxisSpacing: 16,
//                   ),
//                   itemBuilder: (BuildContext context, int index) {
//                     return const AdCard();
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
