import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayerController extends GetxController {
  final String videoUrl;

  VideoPlayerController? videoController;

  final isInitialized = false.obs;
  final isPlaying = false.obs;

  AppVideoPlayerController(this.videoUrl);

  @override
  void onInit() {
    super.onInit();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    if (videoUrl.isEmpty) {
      return;
    }

    videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    await videoController!.initialize();

    isInitialized.value = true;
    isPlaying.value = videoController!.value.isPlaying;

    videoController!.addListener(() {
      if (videoController == null) return;
      isPlaying.value = videoController!.value.isPlaying;
    });

    videoController!.play();
  }

  void togglePlay() {
    if (videoController == null) return;

    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }

  @override
  void onClose() {
    videoController?.dispose();
    videoController = null;
    super.onClose();
  }
}
