import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/home_controller/home_controller.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/testimonial/testimonial_card.dart';

class TestimonialsSection extends StatelessWidget {
  TestimonialsSection({super.key});

  final controller = Get.find<HomeController>();

  final testimonials = const [
    {
      'name': 'Arjun Kp',
      'rating': 4.5,
      'message':
          'This course completely transformed my approach to personal growth. '
          'The lessons are practical and inspiring',
    },
    {
      'name': 'Anjali R',
      'rating': 5.0,
      'message': 'Well structured content and easy to follow sessions.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'What Learners Are Saying',
            style: TextStyleClass.primaryFont700(22, ColorClass.textBlack),
          ),
        ),
        const SizedBox(height: 16),

        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: testimonials.length,
            onPageChanged: controller.updateTestimonialIndex,
            itemBuilder: (_, index) {
              final item = testimonials[index];
              return TestimonialCard(
                name: item['name'] as String,
                rating: item['rating'] as double,
                message: item['message'] as String,
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              testimonials.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 6,
                width: controller.testimonialIndex.value == index ? 18 : 6,
                decoration: BoxDecoration(
                  color: controller.testimonialIndex.value == index
                      ? ColorClass.primaryBase
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
