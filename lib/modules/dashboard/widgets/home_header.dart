import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/icons_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/model/home_model.dart';

class HomeHeader extends StatelessWidget {
  final HomeModel home;

  const HomeHeader({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: ColorClass.primaryBase,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            home.user.greeting,
            style: TextStyleClass.primaryFont600(18, ColorClass.white),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.streak),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: ColorClass.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(IconClass.appIcon, height: 16),
                  const SizedBox(width: 6),
                  Text(
                    'Day ${home.user.streakDays}',
                    style: TextStyleClass.primaryFont500(
                      14,
                      ColorClass.primaryBase,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
