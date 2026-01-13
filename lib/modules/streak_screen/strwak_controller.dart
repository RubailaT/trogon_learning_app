import 'package:get/get.dart';
import 'package:trogon_learning_app/app/services/api_services.dart';
import 'package:trogon_learning_app/modules/streak_screen/streak_model/streak_model.dart';

class StreakController extends GetxController {
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  final streak = Rxn<StreakModel>();

  @override
  void onInit() {
    super.onInit();
    fetchStreak();
  }

  Future<void> fetchStreak() async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await ApiService.get('streak.php');

      if (response.data != null) {
        streak.value = StreakModel.fromJson(response.data);
      } else {
        errorMessage('No streak data');
      }
    } catch (e) {
      errorMessage('Failed to load streak');
    } finally {
      isLoading(false);
    }
  }

  /// Helpers (clean & readable)
  bool isDayCompleted(StreakDay day) => day.isCompleted;
  bool isCurrentDay(StreakDay day) => day.isCurrent;
}
