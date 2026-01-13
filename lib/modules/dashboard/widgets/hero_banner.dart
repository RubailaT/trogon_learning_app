import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:trogon_learning_app/constants/color_class.dart';
import 'package:trogon_learning_app/constants/textstyle_class.dart';
import 'package:trogon_learning_app/modules/dashboard/home_controller/home_controller.dart';
import 'package:trogon_learning_app/modules/dashboard/model/home_model.dart';

class HeroBanners extends StatelessWidget {
  final List<HomeBanner> banners;
  final HomeController controller = Get.find();

  HeroBanners({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: banners.length,
            onPageChanged: controller.updateBannerIndex,
            itemBuilder: (_, index) {
              final banner = banners[index];
              return _BannerItem(banner: banner);
            },
          ),
        ),
        Obx(() => _indicator()),
      ],
    );
  }

  Widget _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        banners.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: controller.bannerIndex.value == index ? 18 : 6,
          decoration: BoxDecoration(
            color: controller.bannerIndex.value == index
                ? ColorClass.orangeColor
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class _BannerItem extends StatelessWidget {
  final HomeBanner banner;

  const _BannerItem({required this.banner});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(banner.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.55), Colors.transparent],
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Text(
          banner.title,
          style: TextStyleClass.primaryFont600(16, ColorClass.white),
        ),
      ),
    );
  }
}
