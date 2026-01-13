import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';
import 'package:trogon_learning_app/modules/streak_screen/strwak_controller.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  var currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  Future<void> next() async {
    if (currentIndex.value < 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await completeOnboarding();
    }
  }

  Future<void> skip() async {
    await completeOnboarding();
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool(StringClass.onboarded, true);
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
