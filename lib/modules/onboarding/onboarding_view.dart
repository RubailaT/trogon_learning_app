import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/image_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/app/utils/app_utils.dart';
import 'package:trogon_learning_app/modules/onboarding/widgets/top_curve_clipper.dart';
import 'onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.primaryBase,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          buildPage(
            image: ImageClass.onBoardingImage1,
            title: 'Smarter Learning\nStarts Here',
            description:
                'Personalized lessons that adapt to your pace and goals.',
          ),
          buildPage(
            image: ImageClass.onBoardingImage2,
            title: 'Learn. Practice.\nSucceed.',
            description:
                'Structured content, mock tests and progress tracking.',
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Stack(
      children: [
        /// TOP SECTION
        Container(
          height: Get.height * 0.8,
          width: Get.width,
          color: ColorClass.primaryBase,
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Image.asset(
              image, // Use PNG with transparent bg if possible
              height: 320,
              fit: BoxFit.contain,
            ),
          ),
        ),

        /// BOTTOM WHITE CURVE
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 100, 24, 24),
              width: double.infinity,
              color: ColorClass.white,
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

                  /// INDICATOR
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
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),
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
        ),

        /// FLOATING CENTER ICON
        Positioned(
          bottom: Get.height * 0.38,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: ColorClass.primaryBase,
                shape: BoxShape.circle,
                border: Border.all(color: ColorClass.white, width: 3),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
