import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class JourneyVideoTile extends StatelessWidget {
  final int index;
  final bool isCompleted;
  final bool isLocked;

  const JourneyVideoTile({
    super.key,
    required this.index,
    this.isCompleted = false,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? Colors.green
                    : isLocked
                    ? Colors.grey
                    : ColorClass.primaryBase,
              ),
              child: Icon(
                isCompleted
                    ? Icons.check
                    : isLocked
                    ? Icons.lock
                    : Icons.play_arrow,
                color: Colors.white,
                size: 16,
              ),
            ),
            if (index != 3)
              Container(height: 32, width: 2, color: Colors.grey.shade300),
          ],
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: ColorClass.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Video $index',
                      style: TextStyleClass.primaryFont600(
                        14,
                        ColorClass.textBlack,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Understanding the Basic of Meditation',
                      style: TextStyleClass.primaryFont400(
                        12,
                        ColorClass.textSub500,
                      ),
                    ),
                  ],
                ),

                Icon(
                  Icons.play_circle_outline,
                  color: isLocked ? Colors.grey : ColorClass.primaryBase,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
