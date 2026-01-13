import 'package:get/get.dart';
import 'package:trogon_learning_app/app/services/api_services.dart';

class StreakController extends GetxController {
  var isLoading = true.obs;
  var streakDays = <int>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchStreak();
    super.onInit();
  }

  Future<void> fetchStreak() async {
    try {
      isLoading(true);
      errorMessage.value = '';

      final response = await ApiService.get('streak.php');

      if (response.data != null && response.data['days'] != null) {
        streakDays.value = List<int>.from(response.data['days']);
      } else {
        streakDays.clear();
      }
    } catch (e) {
      errorMessage.value = 'Failed to load streak';
    } finally {
      isLoading(false);
    }
  }

  bool isActiveDay(int day) {
    return streakDays.contains(day);
  }
}
