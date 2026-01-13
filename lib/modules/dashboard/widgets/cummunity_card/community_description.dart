import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class CommunityDescription extends StatelessWidget {
  const CommunityDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Connect with learners across all courses. '
      'Share experiences, ask questions, and grow together in your learning journey.',
      style: TextStyleClass.primaryFont400(14, ColorClass.textSub500),
    );
  }
}
