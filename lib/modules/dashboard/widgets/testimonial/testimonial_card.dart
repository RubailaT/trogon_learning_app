import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class TestimonialCard extends StatelessWidget {
  final String name;
  final double rating;
  final String message;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.rating,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorClass.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorClass.primaryBase,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorClass.white,
                  child: Text(
                    name[0],
                    style: TextStyleClass.primaryFont600(
                      16,
                      ColorClass.primaryBase,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyleClass.primaryFont600(
                        16,
                        ColorClass.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: ColorClass.yellowBase,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyleClass.primaryFont500(
                            14,
                            ColorClass.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Body
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              message,
              style: TextStyleClass.primaryFont400(14, ColorClass.textSub500),
            ),
          ),
        ],
      ),
    );
  }
}
