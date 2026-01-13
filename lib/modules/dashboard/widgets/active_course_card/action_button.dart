import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ActionButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: ColorClass.primaryBase,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: TextStyleClass.primaryFont500(14, ColorClass.white),
        ),
      ),
    );
  }
}
