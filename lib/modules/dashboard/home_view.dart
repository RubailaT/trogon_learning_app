import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/active_course_card/active_course_card.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/hero_banner.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/home_header.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/live_section_card.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/popular_course_card/popular_course_section.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/testimonial/testimonial_section.dart';
import '../../app/utils/app_utils.dart';
import 'home_controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.bgWeak100,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return AppUtils.loading();
          }

          if (controller.errorMessage.isNotEmpty) {
            return AppUtils.errorState(
              message: controller.errorMessage.value,
              onRetry: controller.fetchHome,
            );
          }

          final home = controller.homeData;

          if (home == null) {
            return AppUtils.emptyState(message: 'No data available');
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(home: home),
                HeroBanners(banners: home.heroBanners),
                ActiveCourseCard(course: home.activeCourse),
                PopularCoursesSection(home: home, controller: controller),
                LiveSessionCard(home: home),
                TestimonialsSection(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
