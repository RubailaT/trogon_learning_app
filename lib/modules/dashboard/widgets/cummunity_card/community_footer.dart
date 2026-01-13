import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/cummunity_card/avatar_widget.dart';

class CommunityFooter extends StatelessWidget {
  const CommunityFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CommunityAvatar(),
            CommunityAvatar(offset: -10),
            CommunityAvatar(offset: -20),
            SizedBox(width: 4),
            Text(
              '12 recent posts',
              style: TextStyleClass.primaryFont400(13, ColorClass.textSub500),
            ),
          ],
        ),
        Text(
          'Active now',
          style: TextStyleClass.primaryFont500(13, Colors.green),
        ),
      ],
    );
  }
}
