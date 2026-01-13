import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/model/home_model.dart';

class LiveSessionCard extends StatelessWidget {
  final HomeModel home;
  final VoidCallback? onJoinTap;

  const LiveSessionCard({super.key, required this.home, this.onJoinTap});

  @override
  Widget build(BuildContext context) {
    final session = home.liveSession;

    if (!session.isLive) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorClass.yellowBase.withOpacity(0.35),
            ColorClass.yellowBase.withOpacity(0.18),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Live badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Live',
                    style: TextStyleClass.primaryFont500(12, ColorClass.white),
                  ),
                ),

                const SizedBox(height: 12),

                // Title
                Text(
                  session.title,
                  style: TextStyleClass.primaryFont600(
                    18,
                    ColorClass.textBlack,
                  ),
                ),

                const SizedBox(height: 6),

                // Instructor
                Text(
                  session.instructorName,
                  style: TextStyleClass.primaryFont400(
                    14,
                    ColorClass.textBlack.withOpacity(0.7),
                  ),
                ),

                const SizedBox(height: 8),

                // Date & time
                Text(
                  'Session ${session.sessionDetails.sessionNumber} • '
                  '${session.sessionDetails.date} ${session.sessionDetails.time}',
                  style: TextStyleClass.primaryFont400(
                    13,
                    ColorClass.textBlack.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // RIGHT BUTTON
          GestureDetector(
            onTap: onJoinTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: ColorClass.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorClass.yellowBase, width: 1.5),
              ),
              child: Text(
                'Join Now',
                style: TextStyleClass.primaryFont600(14, ColorClass.yellowBase),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
