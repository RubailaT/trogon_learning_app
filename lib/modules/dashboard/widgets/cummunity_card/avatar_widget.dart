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
          border: Border.all(color: ColorClass.white, width: 2),
          image: const DecorationImage(
            image: AssetImage('assets/images/dpUser.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
