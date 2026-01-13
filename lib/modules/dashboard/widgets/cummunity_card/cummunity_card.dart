import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/cummunity_card/community_description.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/cummunity_card/community_footer.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/cummunity_card/cummunity_header.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/cummunity_card/join_discussion_button.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorClass.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CommunityHeader(),
          SizedBox(height: 12),
          CommunityDescription(),
          SizedBox(height: 16),
          CommunityFooter(),
          SizedBox(height: 16),
          JoinDiscussionButton(),
        ],
      ),
    );
  }
}
