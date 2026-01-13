import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';
import 'package:trogon_learning_app/modules/dashboard/home_view.dart';
import 'package:trogon_learning_app/modules/onboarding/onboarding_view.dart';
import 'package:trogon_learning_app/modules/streak_screen/streak_view.dart';
import 'package:trogon_learning_app/modules/video_player_screen/video_player_view.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.onboarding, page: () => OnboardingView()),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
    GetPage(name: AppRoutes.video, page: () => VideoPlayerView()),
    GetPage(name: AppRoutes.streak, page: () => StreakView()),
  ];
}
