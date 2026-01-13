import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void next() {
    if (currentIndex.value < 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      goToDashboard();
    }
  }

  void skip() {
    goToDashboard();
  }

  void goToDashboard() {
    Get.offAllNamed(AppRoutes.main); 
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
