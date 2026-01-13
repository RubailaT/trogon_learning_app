import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/video_player_screen/video_player_controller/journey_controller.dart';
import 'package:trogon_learning_app/modules/video_player_screen/widgets/journey_video.dart';

class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VedioPlayerController());

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorClass.white,
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorClass.primaryBase.withOpacity(0.08),
            ColorClass.primaryBase.withOpacity(0.02),
          ],
        ),
      ),
      child: Obx(() {
        // Loading state
        if (controller.isLoading.value) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Error state
        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 8),
                  Text(
                    controller.errorMessage.value,
                    style: TextStyleClass.primaryFont400(14, Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: controller.fetchVideos,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        // Empty state
        if (controller.videos.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'No videos available',
                style: TextStyleClass.primaryFont400(14, ColorClass.textSub500),
              ),
            ),
          );
        }

        // Success state with video list
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.journeyTitle.value.isNotEmpty
                  ? controller.journeyTitle.value
                  : 'Meditation Journey',
              style: TextStyleClass.primaryFont700(18, ColorClass.textBlack),
            ),
            const SizedBox(height: 16),

            // Video tiles
            ...controller.videos.asMap().entries.map((entry) {
              final index = entry.key;
              final video = entry.value;
              final isLast = index == controller.videos.length - 1;

              return JourneyVideoTile(video: video, isLast: isLast);
            }),
          ],
        );
      }),
    );
  }
}
