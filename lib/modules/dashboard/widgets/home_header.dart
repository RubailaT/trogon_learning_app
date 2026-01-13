import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trogon_learning_app/app/routes/app_routes.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/icons_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/model/home_model.dart';
import 'package:trogon_learning_app/modules/dashboard/widgets/hero_banner.dart';

class HomeHeader extends StatelessWidget {
  final HomeModel home;
  final List<HomeBanner> banners;

  const HomeHeader({super.key, required this.home, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // HEADER BACKGROUND
          Container(
            height: Get.height * 0.25,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
            decoration: const BoxDecoration(
              color: ColorClass.primaryBase,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  home.user.greeting,
                  style: TextStyleClass.primaryFont600(14, ColorClass.white),
                ),
                Row(
                  children: [
                    StreakBadge(home: home),
                    const SizedBox(width: 8),
                    NotificationBadge(),
                  ],
                ),
              ],
            ),
          ),

          // HERO BANNER (FLOATING)
          Positioned(
            bottom: -85,
            left: 0,
            right: 0,
            child: HeroBanners(banners: banners),
          ),
        ],
      ),
    );
  }
}

class StreakBadge extends StatelessWidget {
  final HomeModel home;

  const StreakBadge({required this.home});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.streak),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: ColorClass.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              'Day ${home.user.streakDays} 🔥',
              style: TextStyleClass.primaryFont500(14, ColorClass.textBlack),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorClass.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(Icons.notifications, color: ColorClass.textBlack),

            Positioned(
              top: -2,
              right: -2,
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
