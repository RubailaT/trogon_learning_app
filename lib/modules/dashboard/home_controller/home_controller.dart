import 'package:get/get.dart';
import 'package:trogon_learning_app/app/services/api_services.dart';
import 'package:trogon_learning_app/modules/dashboard/model/home_model.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  HomeModel? homeData;

  final bannerIndex = 0.obs;
  final selectedCourseIndex = 0.obs;
  final testimonialIndex = 0.obs;

  @override
  void onInit() {
    fetchHome();
    super.onInit();
  }

  void updateBannerIndex(int index) {
    bannerIndex.value = index;
  }

  void selectCourse(int index) {
    selectedCourseIndex.value = index;
  }

  void updateTestimonialIndex(int index) {
    testimonialIndex.value = index;
  }

  Future<void> fetchHome() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      homeData = await ApiService.fetchHome();
    } catch (e) {
      errorMessage.value = 'Failed to load home data';
    } finally {
      isLoading.value = false;
    }
  }
}
