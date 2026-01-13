import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/model/home_model.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/active_course_card/action_button.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/active_course_card/progress_circle.dart';

class ActiveCourseCard extends StatelessWidget {
  final ActiveCourse course;

  const ActiveCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Active Courses',
            style: TextStyleClass.primaryFont700(20, ColorClass.textBlack),
          ),
        ),
        const SizedBox(height: 12),

        // Card
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorClass.gradientBlue1, ColorClass.gradientBlue2],
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            children: [
              ProgressCircle(percentage: course.progress),
              const SizedBox(width: 16),

              Expanded(child: _CourseInfo(course: course)),
            ],
          ),
        ),
      ],
    );
  }
}

class _CourseInfo extends StatelessWidget {
  final ActiveCourse course;

  const _CourseInfo({required this.course});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.title,
          style: TextStyleClass.primaryFont600(18, ColorClass.white),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorClass.yellowBase, width: 2),
              ),
              child: Icon(Icons.star, size: 14, color: ColorClass.yellowBase),
            ),
            const SizedBox(width: 8),
            Text(
              '${course.testsCompleted}/${course.totalTests} Tests',
              style: TextStyleClass.primaryFont500(14, ColorClass.white),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            ActionButton(
              title: 'Continue >>>',
              onTap: () {
                final currentVideo = course.currentVideo;

                if (currentVideo == null || currentVideo.videoUrl.isEmpty) {
                  Get.snackbar('Error', 'No video available for this course');
                  return;
                }

                Get.toNamed(AppRoutes.video, arguments: currentVideo.videoUrl);
              },
            ),

            const SizedBox(width: 12),
            ActionButton(title: 'Shift Course', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
