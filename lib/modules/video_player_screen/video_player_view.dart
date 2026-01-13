import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/modules/video_player_screen/video_player_controller/journey_controller.dart';
import 'package:trogon_learning_app/modules/video_player_screen/widgets/video_player_header.dart';
import 'package:trogon_learning_app/modules/video_player_screen/widgets/video_info.dart';
import 'widgets/journey_section.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final String? argVideoUrl = Get.arguments as String?;

    // Initialize the journey controller to fetch videos
    final journeyController = Get.put(VedioPlayerController());

    return Scaffold(
      backgroundColor: ColorClass.bgWeak100,
      body: SafeArea(
        child: Obx(() {
          //video URL to play
          String videoUrl;

          if (argVideoUrl != null && argVideoUrl.isNotEmpty) {
            // Use provided URL
            videoUrl = argVideoUrl;
          } else if (!journeyController.isLoading.value) {
            // Get current playable video from controller
            final currentVideo = journeyController.currentPlayableVideo;
            if (currentVideo != null && currentVideo.videoUrl != null) {
              videoUrl = currentVideo.videoUrl!;
            } else {
              videoUrl = '';
            }
          } else {
            videoUrl = '';
          }

          return Column(
            children: [
              // Video player header
              if (videoUrl.isNotEmpty)
                VideoPlayerHeader(videoUrl: videoUrl)
              else if (journeyController.isLoading.value)
                const AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Center(child: CupertinoActivityIndicator()),
                )
              else
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'No video available',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

              // Scrollable content
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [VideoInfoTile(), JourneySection()]),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
