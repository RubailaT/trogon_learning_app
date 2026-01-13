import 'package:get/get.dart';
import 'package:trogon_learning_app/app/services/api_services.dart';
import 'package:trogon_learning_app/modules/video_player_screen/model/video_model.dart';

class VedioPlayerController extends GetxController {
  final isLoading = true.obs;
  final errorMessage = ''.obs;
  final journeyTitle = ''.obs;
  final videos = <VideoItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await ApiService.fetchVideoDetails();

      if (response.status == 1) {
        journeyTitle.value = response.data.title;
        videos.value = response.data.videos;
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      errorMessage.value = 'Failed to load videos: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Get video that can be played (first in_progress or first available)
  VideoItem? get currentPlayableVideo {
    // First try to find in_progress video
    final inProgress = videos.firstWhereOrNull((v) => v.isInProgress);
    if (inProgress != null) return inProgress;

    // Then try to find first playable video
    return videos.firstWhereOrNull((v) => v.canPlay);
  }
}
