import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/video_player_screen/widgets/ideo_player_header.dart';
import 'package:trogon_learning_app/modules/video_player_screen/widgets/video_info.dart';
import 'widgets/journey_section.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    final String videoUrl =
        (Get.arguments as String?) ??
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

    return Scaffold(
      backgroundColor: ColorClass.bgWeak100,
      body: SafeArea(
        child: Column(
          children: [
            VideoPlayerHeader(videoUrl: videoUrl),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(children: [VideoInfoTile(), JourneySection()]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
