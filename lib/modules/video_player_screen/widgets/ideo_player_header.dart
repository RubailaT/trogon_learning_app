import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerHeader extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerHeader({super.key, required this.videoUrl});

  @override
  State<VideoPlayerHeader> createState() => VideoPlayerHeaderState();
}

class VideoPlayerHeaderState extends State<VideoPlayerHeader> {
  late final VideoPlayerController videoController;
  bool showControls = true;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  void initializeVideo() {
    videoController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void togglePlayPause() {
    setState(() {
      videoController.value.isPlaying
          ? videoController.pause()
          : videoController.play();
    });
  }

  void toggleControlsVisibility() {
    setState(() {
      showControls = !showControls;
    });
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: videoController.value.isInitialized
              ? videoController.value.aspectRatio
              : 16 / 9,
          child: videoController.value.isInitialized
              ? GestureDetector(
                  onTap: toggleControlsVisibility,
                  child: VideoPlayer(videoController),
                )
              : const Center(child: CircularProgressIndicator()),
        ),

        if (showControls) buildPlayPauseButton(),

        buildBackButton(),
      ],
    );
  }

  Widget buildPlayPauseButton() {
    return Positioned.fill(
      child: Center(
        child: IconButton(
          iconSize: 64,
          icon: Icon(
            videoController.value.isPlaying
                ? Icons.pause_circle_filled
                : Icons.play_circle_filled,
            color: Colors.white,
          ),
          onPressed: togglePlayPause,
        ),
      ),
    );
  }

  Widget buildBackButton() {
    return Positioned(
      top: 12,
      left: 12,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
