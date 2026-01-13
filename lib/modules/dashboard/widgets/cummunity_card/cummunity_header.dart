import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class CommunityHeader extends StatelessWidget {
  const CommunityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: ColorClass.primaryBase.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.groups, color: ColorClass.primaryBase),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Community',
              style: TextStyleClass.primaryFont600(16, ColorClass.textBlack),
            ),
            const SizedBox(height: 4),
            Text(
              '2,847 active members',
              style: TextStyleClass.primaryFont400(13, ColorClass.textSub500),
            ),
          ],
        ),
      ],
    );
  }
}
