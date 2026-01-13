import 'package:flutter/material.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/help_support/support_button.dart';

class TextContent extends StatelessWidget {
  const TextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Have any Questions?',
          style: TextStyleClass.primaryFont700(18, ColorClass.textBlack),
        ),
        const SizedBox(height: 6),

        Text(
          'Our experts can answer all your questions',
          style: TextStyleClass.primaryFont400(14, ColorClass.textSub500),
        ),
        const SizedBox(height: 6),

        Text(
          '"How batches work?"',
          style: TextStyleClass.primaryFont400(13, ColorClass.textSub500),
        ),
        const SizedBox(height: 16),

        Row(
          children: const [
            Expanded(
              child: SupportButton(
                icon: Icons.chat_bubble_outline,
                title: 'Chat with us',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: SupportButton(icon: Icons.call_outlined, title: 'Call us'),
            ),
          ],
        ),
      ],
    );
  }
}
