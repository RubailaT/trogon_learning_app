import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';

class ProgressCircle extends StatelessWidget {
  final int percentage;
  final double size;
  final double strokeWidth;

  const ProgressCircle({
    super.key,
    required this.percentage,
    this.size = 72,
    this.strokeWidth = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: strokeWidth,
            backgroundColor: Colors.white.withOpacity(0.3),
            valueColor: const AlwaysStoppedAnimation(ColorClass.yellowBase),
          ),
        ),
        Text(
          '$percentage%',
          style: TextStyleClass.primaryFont600(16, ColorClass.yellowBase),
        ),
      ],
    );
  }
}
