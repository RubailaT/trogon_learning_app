import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class SupportButton extends StatelessWidget {
  final IconData icon;
  final String title;

  const SupportButton({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: ColorClass.textBlack),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyleClass.primaryFont500(14, ColorClass.textBlack),
          ),
        ],
      ),
    );
  }
}
