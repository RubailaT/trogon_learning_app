import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/image_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/app/utils/app_utils.dart';
import 'onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          _buildPage(
            image: ImageClass.onBoardingImage1,
            title: 'Smarter Learning\nStarts Here',
            description:
                'Personalized lessons that adapt to your pace and goals.',
          ),
          _buildPage(
            image: ImageClass.onBoardingImage2,
            title: 'Learn. Practice.\nSucceed.',
            description:
                'Structured content, mock tests and progress tracking.',
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.55,
          color: ColorClass.primaryBase,
          child: Center(child: SvgPicture.asset(image, height: 280)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: ColorClass.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyleClass.primaryFont700(
                    26,
                    ColorClass.textBlack,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyleClass.primaryFont400(
                    14,
                    ColorClass.textBlack,
                  ),
                ),
                const SizedBox(height: 24),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      2,
                      (i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: controller.currentIndex.value == i
                              ? ColorClass.primaryBase
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                AppUtils.primaryButton(title: 'Next', onTap: controller.next),
                TextButton(
                  onPressed: controller.skip,
                  child: Text(
                    'Skip',
                    style: TextStyleClass.primaryFont500(
                      14,
                      ColorClass.primaryBase,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
