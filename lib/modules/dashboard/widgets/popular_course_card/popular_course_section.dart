import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/home_controller/home_controller.dart';
import 'package:trogon_learning_app/modules/dashboard/model/home_model.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/popular_course_card/popular_course_card.dart';

class PopularCoursesSection extends StatelessWidget {
  final HomeModel home;
  final HomeController controller;

  const PopularCoursesSection({
    super.key,
    required this.home,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final categories = home.popularCourses;

    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Courses',
                style: TextStyleClass.primaryFont700(20, ColorClass.textBlack),
              ),
              Text(
                'View all',
                style: TextStyleClass.primaryFont500(
                  14,
                  ColorClass.primaryBase,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Category chips
        SizedBox(
          height: 40,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) {
              return Obx(() {
                final isSelected =
                    controller.selectedCourseIndex.value == index;

                return GestureDetector(
                  onTap: () => controller.selectCourse(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? ColorClass.primaryBase
                          : ColorClass.bgWeak100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index].name,
                      style: TextStyleClass.primaryFont500(
                        14,
                        isSelected ? ColorClass.white : ColorClass.primaryBase,
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),

        const SizedBox(height: 20),

        // Courses grid
        Obx(() {
          final courses =
              categories[controller.selectedCourseIndex.value].courses;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (_, index) {
                return PopularCourseCard(course: courses[index], onTap: () {});
              },
            ),
          );
        }),
      ],
    );
  }
}
