import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/video_player_screen/widgets/journey_video.dart';

class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meditation Journey',
            style: TextStyleClass.primaryFont700(18, ColorClass.textBlack),
          ),
          const SizedBox(height: 16),

          const JourneyVideoTile(index: 1, isCompleted: true),
          const JourneyVideoTile(index: 2, isLocked: true),
          const JourneyVideoTile(index: 3, isLocked: true),
        ],
      ),
    );
  }
}
