import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class AppUtils {
  // Snackbar
  static void showSnackBar(String message) {
    Get.snackbar(
      'Message',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorClass.primaryBase,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }

  // Loader
  static Widget loading() {
    return const Center(child: CupertinoActivityIndicator());
  }

  // Empty state
  static Widget emptyState({required String message}) {
    return Center(
      child: Text(
        message,
        style: TextStyleClass.primaryFont400(14, ColorClass.textBlack),
      ),
    );
  }

  // Error state with retry
  static Widget errorState({
    required String message,
    required VoidCallback onRetry,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, style: TextStyleClass.primaryFont400(14, Colors.red)),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: onRetry,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: ColorClass.primaryBase,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Retry',
                style: TextStyleClass.primaryFont500(14, ColorClass.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Primary button
  static Widget primaryButton({
    required String title,
    required VoidCallback onTap,
    bool isDisabled = false,
    bool isLoading = false,
  }) {
    return GestureDetector(
      onTap: isDisabled || isLoading ? null : onTap,
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey.shade300 : ColorClass.primaryBase,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  title,
                  style: TextStyleClass.primaryFont500(16, ColorClass.white),
                ),
        ),
      ),
    );
  }
}
