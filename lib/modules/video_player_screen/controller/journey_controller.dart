import 'package:get/get.dart';
import 'package:trogon_learning_app/app/services/api_services.dart';
import 'package:trogon_learning_app/modules/video_player_screen/model/video_model.dart';

class JourneyController extends GetxController {
  final isLoading = true.obs;
  final errorMessage = ''.obs;
  final journeyTitle = ''.obs;
  final videos = <VideoItem>[].obs;
  final currentVideoIndex = 0.obs;

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
        
        // Set current video to first in-progress or first available
        final inProgressIndex = videos.indexWhere((v) => v.isInProgress);
        if (inProgressIndex >= 0) {
          currentVideoIndex.value = inProgressIndex;
        }
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      errorMessage.value = 'Failed to load videos: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Get current video being played/displayed
  VideoItem? get currentVideo {
    if (videos.isEmpty) return null;
    if (currentVideoIndex.value >= videos.length) return null;
    return videos[currentVideoIndex.value];
  }

  /// Get video that can be played (first in_progress or first available)
  VideoItem? get currentPlayableVideo {
    // First try to find in_progress video
    final inProgress = videos.firstWhereOrNull((v) => v.isInProgress);
    if (inProgress != null) return inProgress;
    
    // Then try to find first playable video
    return videos.firstWhereOrNull((v) => v.canPlay);
  }

  /// Set current video by index
  void setCurrentVideo(int index) {
    if (index >= 0 && index < videos.length) {
      currentVideoIndex.value = index;
    }
  }
}
