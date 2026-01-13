import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/streak_screen/streak_model/streak_model.dart';
import 'package:trogon_learning_app/modules/streak_screen/strwak_controller.dart';
import 'package:trogon_learning_app/modules/streak_screen/widgets/path_painter.dart';

class StreakScreen extends StatelessWidget {
  StreakScreen({super.key});

  final StreakController controller = Get.put(StreakController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorClass.cyanLight, ColorClass.cyanBase],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (controller.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  controller.errorMessage.value,
                  style: TextStyleClass.primaryFont500(
                    14,
                    ColorClass.textBlack,
                  ),
                ),
              );
            }

            final streak = controller.streak.value;
            if (streak == null) return const SizedBox.shrink();

            return _streakContent(streak);
          }),
        ),
      ),
    );
  }

  // ================= MAIN CONTENT =================

  Widget _streakContent(StreakModel streak) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [ColorClass.cyanLight, ColorClass.cyanBase],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Stack(
            children: [
              Positioned.fill(child: CustomPaint(painter: PathPainter())),

              ..._buildDayBubbles(streak.days),

              if (streak.days.any((d) => d.isCurrent))
                Positioned(
                  top: 260,
                  right: 40,
                  child: _todayTopicCard(
                    streak.days.firstWhere((d) => d.isCurrent),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= DAY BUBBLES =================

  List<Widget> _buildDayBubbles(List<StreakDay> days) {
    final positions = [
      {'top': 60.0, 'right': 40.0},
      {'top': 130.0, 'left': 40.0},
      {'top': 220.0, 'left': 80.0},
      {'top': 320.0, 'right': 60.0},
      {'top': 420.0, 'left': 60.0},
      {'top': 520.0, 'left': 90.0},
      {'top': 620.0, 'right': 70.0},
      {'bottom': 40.0, 'left': 120.0},
    ];

    return List.generate(days.length, (index) {
      final day = days[index];
      final pos = positions[index];

      return Positioned(
        top: pos['top'],
        left: pos['left'],
        right: pos['right'],
        bottom: pos['bottom'],
        child: _dayBubble(day),
      );
    });
  }

  Widget _dayBubble(StreakDay day) {
    return Container(
      height: 64,
      width: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: day.isCompleted
            ? Colors.green
            : day.isCurrent
            ? Colors.orange
            : const Color(0xFF4BA7B7),
        shape: BoxShape.circle,
        border: day.isCurrent
            ? Border.all(color: Colors.white, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        'Day\n${day.dayNumber}',
        textAlign: TextAlign.center,
        style: TextStyleClass.primaryFont600(12, ColorClass.white),
      ),
    );
  }

  // ================= TODAY TOPIC CARD =================

  Widget _todayTopicCard(StreakDay day) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF4BA7B7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Topic",
            style: TextStyleClass.primaryFont500(
              12,
              ColorClass.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            day.topic.title,
            style: TextStyleClass.primaryFont600(14, ColorClass.white),
          ),
          const Divider(),
          ...day.topic.modules.map(
            (m) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                m.name,
                style: TextStyleClass.primaryFont500(13, ColorClass.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
