import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class JoinDiscussionButton extends StatelessWidget {
  const JoinDiscussionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: ColorClass.bgWeak100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          'Join Discussion',
          style: TextStyleClass.primaryFont600(16, ColorClass.primaryBase),
        ),
      ),
    );
  }
}
