/// Model for the video list API response
class VideoListResponse {
  final int status;
  final String message;
  final VideoListData data;

  VideoListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VideoListResponse.fromJson(Map<String, dynamic> json) {
    return VideoListResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      data: VideoListData.fromJson(json['data'] ?? {}),
    );
  }
}

class VideoListData {
  final String title;
  final List<VideoItem> videos;

  VideoListData({
    required this.title,
    required this.videos,
  });

  factory VideoListData.fromJson(Map<String, dynamic> json) {
    return VideoListData(
      title: json['title'] ?? '',
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => VideoItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class VideoItem {
  final int id;
  final String title;
  final String description;
  final String status; // "completed", "in_progress", "locked"
  final String? videoUrl;
  final int totalDuration;
  final int watchedDuration;
  final int progressPercentage;
  final bool hasPlayButton;

  VideoItem({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    this.videoUrl,
    required this.totalDuration,
    required this.watchedDuration,
    required this.progressPercentage,
    required this.hasPlayButton,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 'locked',
      videoUrl: json['video_url'],
      totalDuration: json['total_duration'] ?? 0,
      watchedDuration: json['watched_duration'] ?? 0,
      progressPercentage: json['progress_percentage'] ?? 0,
      hasPlayButton: json['has_play_button'] ?? false,
    );
  }

  bool get isCompleted => status == 'completed';
  bool get isInProgress => status == 'in_progress';
  bool get isLocked => status == 'locked';
  bool get canPlay => hasPlayButton && videoUrl != null && videoUrl!.isNotEmpty;
}
