import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';

class CommunityAvatar extends StatelessWidget {
  final double offset;

  const CommunityAvatar({super.key, this.offset = 0});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(offset, 0),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorClass.primaryBase.withOpacity(0.2),
          border: Border.all(color: ColorClass.white, width: 2),
        ),
        child: const Icon(
          Icons.person,
          size: 16,
          color: ColorClass.primaryBase,
        ),
      ),
    );
  }
}
