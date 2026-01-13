import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerHeader extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerHeader({super.key, required this.videoUrl});

  @override
  State<VideoPlayerHeader> createState() => VideoPlayerHeaderState();
}

class VideoPlayerHeaderState extends State<VideoPlayerHeader> {
  late VideoPlayerController videoController;
  bool showControls = true;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  void initializeVideo() {
    videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          isInitialized = true;
        });
        // Add listener to update UI when position changes
        videoController.addListener(_videoListener);
      }).catchError((error) {
        debugPrint('Video initialization error: $error');
      });
  }

  void _videoListener() {
    if (mounted) {
      setState(() {});
    }
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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    
    if (hours > 0) {
      return '$hours:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    videoController.removeListener(_videoListener);
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video player
        AspectRatio(
          aspectRatio: isInitialized
              ? videoController.value.aspectRatio
              : 16 / 9,
          child: isInitialized
              ? GestureDetector(
                  onTap: toggleControlsVisibility,
                  child: VideoPlayer(videoController),
                )
              : Container(
                  color: Colors.black,
                  child: const Center(child:  CupertinoActivityIndicator()),
                ),
        ),

        // Controls overlay
        if (showControls && isInitialized) ...[
          // Dark overlay
          Positioned.fill(
            child: GestureDetector(
              onTap: toggleControlsVisibility,
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),

          // Play/Pause button
          buildPlayPauseButton(),

          // Progress bar and duration
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: buildProgressBar(),
          ),
        ],

        // Back button (always visible)
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

  Widget buildProgressBar() {
    final position = videoController.value.position;
    final duration = videoController.value.duration;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
              activeTrackColor: Colors.red,
              inactiveTrackColor: Colors.white.withOpacity(0.3),
              thumbColor: Colors.red,
              overlayColor: Colors.red.withOpacity(0.3),
            ),
            child: Slider(
              value: duration.inMilliseconds > 0
                  ? position.inMilliseconds / duration.inMilliseconds
                  : 0,
              onChanged: (value) {
                final newPosition = Duration(
                  milliseconds: (value * duration.inMilliseconds).toInt(),
                );
                videoController.seekTo(newPosition);
              },
            ),
          ),

          // Duration text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(position),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _formatDuration(duration),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackButton() {
    return Positioned(
      top: 12,
      left: 12,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
