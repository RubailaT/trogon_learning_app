import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/icons_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/streak_screen/strwak_controller.dart';

class StreakView extends StatelessWidget {
  StreakView({super.key});

  final controller = Get.put(StreakController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning Streak')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 7,
          itemBuilder: (_, index) {
            final day = index + 1;
            final isActive = controller.isActiveDay(day);

            return GestureDetector(
              onTap: () {
                // optional: show day info
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? ColorClass.primaryBase.withOpacity(0.1)
                      : ColorClass.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isActive
                        ? ColorClass.primaryBase
                        : Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    // Fire icon (SVG)
                    SvgPicture.asset(
                      IconClass.appIcon,
                      height: 22,
                      color: isActive ? ColorClass.primaryBase : Colors.grey,
                    ),

                    const SizedBox(width: 12),

                    // Day text
                    Text(
                      'Day $day',
                      style: TextStyleClass.primaryFont500(
                        15,
                        isActive
                            ? ColorClass.primaryBase
                            : ColorClass.textBlack,
                      ),
                    ),

                    const Spacer(),

                    // Status text
                    if (isActive)
                      Text(
                        'Completed',
                        style: TextStyleClass.primaryFont400(
                          13,
                          ColorClass.primaryBase,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
