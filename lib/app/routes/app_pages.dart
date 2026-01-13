import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';
import 'package:trogon_learning_app/modules/dashboard/home_view.dart';
import 'package:trogon_learning_app/modules/onboarding/onboarding_view.dart';
import 'package:trogon_learning_app/modules/streak_screen/streak_view.dart';
import 'package:trogon_learning_app/modules/video_player_screen/video_player_view.dart';
import 'package:trogon_learning_app/screens/bottom_navigation_screen/bottom_navigation_view.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingView()),
    GetPage(name: AppRoutes.main, page: () => BottomNavigationView()),
    GetPage(name: AppRoutes.video, page: () => const VideoPlayerView()),
    GetPage(name: AppRoutes.streak, page: () => StreakScreen()),
  ];
}
