import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class VideoInfoTile extends StatelessWidget {
  const VideoInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Video 1',
                style: TextStyleClass.primaryFont600(16, ColorClass.textBlack),
              ),
              const SizedBox(height: 4),
              Text(
                'Understanding the Basic of Meditation',
                style: TextStyleClass.primaryFont400(14, ColorClass.textSub500),
              ),
            ],
          ),

          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorClass.primaryBase),
            ),
            child: const Icon(Icons.download, color: ColorClass.primaryBase),
          ),
        ],
      ),
    );
  }
}
