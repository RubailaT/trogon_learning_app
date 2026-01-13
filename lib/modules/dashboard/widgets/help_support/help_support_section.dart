import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/help_support/support_illustration.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/help_support/text_content.dart';

class HelpSupportSection extends StatelessWidget {
  const HelpSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorClass.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // LEFT CONTENT
          Expanded(child: TextContent()),

          const SizedBox(width: 12),

          // RIGHT ILLUSTRATION
          SupportIllustration(),
        ],
      ),
    );
  }
}
