import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/video_player_screen/model/video_model.dart';

class JourneyVideoTile extends StatelessWidget {
  final VideoItem video;
  final bool isLast;

  const JourneyVideoTile({
    super.key,
    required this.video,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getIndicatorColor(),
              ),
              child: Icon(
                _getIndicatorIcon(),
                color: Colors.white,
                size: 16,
              ),
            ),
            if (!isLast)
              Container(height: 32, width: 2, color: Colors.grey.shade300),
          ],
        ),

        const SizedBox(width: 12),

        // Video card
        Expanded(
          child: GestureDetector(
            onTap: _onTap,
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: ColorClass.white,
                borderRadius: BorderRadius.circular(16),
                border: video.isInProgress
                    ? Border.all(color: ColorClass.primaryBase, width: 2)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video.title,
                          style: TextStyleClass.primaryFont600(
                            14,
                            ColorClass.textBlack,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          video.description,
                          style: TextStyleClass.primaryFont400(
                            12,
                            ColorClass.textSub500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (video.isInProgress) ...[
                          const SizedBox(height: 8),
                          _buildProgressBar(),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildPlayIcon(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getIndicatorColor() {
    if (video.isCompleted) return Colors.green;
    if (video.isInProgress) return ColorClass.primaryBase;
    return Colors.grey;
  }

  IconData _getIndicatorIcon() {
    if (video.isCompleted) return Icons.check;
    if (video.isLocked) return Icons.lock;
    return Icons.play_arrow;
  }

  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: video.progressPercentage / 100,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(ColorClass.primaryBase),
            minHeight: 4,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${video.progressPercentage}% completed',
          style: TextStyleClass.primaryFont400(10, ColorClass.textSub500),
        ),
      ],
    );
  }

  Widget _buildPlayIcon() {
    if (video.isLocked) {
      return const Icon(Icons.lock, color: Colors.grey, size: 24);
    }
    
    if (video.isCompleted) {
      return const Icon(Icons.check_circle, color: Colors.green, size: 24);
    }

    return Icon(
      video.isInProgress ? Icons.play_circle_filled : Icons.play_circle_outline,
      color: ColorClass.primaryBase,
      size: 28,
    );
  }

  void _onTap() {
    if (!video.canPlay) {
      if (video.isLocked) {
        Get.snackbar(
          'Locked',
          'Complete the previous videos to unlock this one',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      return;
    }

    Get.toNamed(AppRoutes.video, arguments: video.videoUrl);
  }
}
