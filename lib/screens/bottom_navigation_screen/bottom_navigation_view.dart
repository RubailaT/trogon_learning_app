import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/screens/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:trogon_learning_app/screens/bottom_navigation_screen/widgets/app_bottom_nav.dart';

import '../../modules/dashboard/home_view.dart';
import '../../modules/video_player_screen/video_player_view.dart';
import '../../modules/streak_screen/streak_view.dart';

class BottomNavigationView extends StatelessWidget {
  BottomNavigationView({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomeView(), // Dashboard
    // VideoListView(),
    VideoPlayerView(),
    StreakScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.bgWeak100,

      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
      ),

      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
