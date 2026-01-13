import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/image_class.dart';

class SupportIllustration extends StatelessWidget {
  const SupportIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 38,
      backgroundColor: Colors.orange.withOpacity(0.15),
      child: Image.asset(
        ImageClass.helpSupportImage,
        width: 200,
        fit: BoxFit.fill,
      ),
    );
  }
}
