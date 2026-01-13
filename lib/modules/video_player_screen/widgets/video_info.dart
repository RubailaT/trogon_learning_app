import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/video_player_screen/video_player_controller/journey_controller.dart';

class VideoInfoTile extends StatelessWidget {
  const VideoInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<VedioPlayerController>(
      builder: (controller) {
        final currentVideo = controller.currentPlayableVideo;

        // Get title and description from current video or use defaults
        final title = currentVideo?.title ?? 'Video';
        final description = currentVideo?.description ?? 'Loading...';

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyleClass.primaryFont600(16, ColorClass.textBlack),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyleClass.primaryFont400(14, ColorClass.textSub500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorClass.offGray, width: 3),
                ),
                child: const Icon(Icons.download, color: ColorClass.textBlack),
              ),
            ],
          ),
        );
      },
    );
  }
}
