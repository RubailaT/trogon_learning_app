class HomeModel {
  final UserModel user;
  final List<HomeBanner> heroBanners;
  final ActiveCourse activeCourse;
  final List<PopularCourse> popularCourses;
  final LiveSession liveSession;

  HomeModel({
    required this.user,
    required this.heroBanners,
    required this.activeCourse,
    required this.popularCourses,
    required this.liveSession,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      user: UserModel.fromJson(json['user']),
      heroBanners: (json['hero_banners'] as List)
          .map((e) => HomeBanner.fromJson(e))
          .toList(),
      activeCourse: ActiveCourse.fromJson(json['active_course']),
      popularCourses: (json['popular_courses'] as List)
          .map((e) => PopularCourse.fromJson(e))
          .toList(),
      liveSession: LiveSession.fromJson(json['live_session']),
    );
  }
}

class UserModel {
  final String name;
  final String greeting;
  final int streakDays;

  UserModel({
    required this.name,
    required this.greeting,
    required this.streakDays,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      greeting: json['greeting'],
      streakDays: json['streak']['days'],
    );
  }
}

class HomeBanner {
  final int id;
  final String title;
  final String image;
  final bool isActive;

  HomeBanner({
    required this.id,
    required this.title,
    required this.image,
    required this.isActive,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) {
    return HomeBanner(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      isActive: json['is_active'] ?? false,
    );
  }
}

class CourseVideo {
  final int id;
  final String title;
  final String videoUrl;

  CourseVideo({required this.id, required this.title, required this.videoUrl});

  factory CourseVideo.fromJson(Map<String, dynamic> json) {
    return CourseVideo(
      id: json['id'],
      title: json['title'],
      videoUrl: json['video_url'],
    );
  }
}

class ActiveCourse {
  final String title;
  final int progress;
  final int testsCompleted;
  final int totalTests;
  final CourseVideo? currentVideo;

  ActiveCourse({
    required this.title,
    required this.progress,
    required this.testsCompleted,
    required this.totalTests,
    this.currentVideo,
  });

  factory ActiveCourse.fromJson(Map<String, dynamic> json) {
    return ActiveCourse(
      title: json['title'],
      progress: json['progress'],
      testsCompleted: json['tests_completed'],
      totalTests: json['total_tests'],
      currentVideo: json['current_video'] != null
          ? CourseVideo.fromJson(json['current_video'])
          : null,
    );
  }
}

class PopularCourse {
  final String name;
  final List<CourseItem> courses;

  PopularCourse({required this.name, required this.courses});

  factory PopularCourse.fromJson(Map<String, dynamic> json) {
    return PopularCourse(
      name: json['name'],
      courses: (json['courses'] as List)
          .map((e) => CourseItem.fromJson(e))
          .toList(),
    );
  }
}

class CourseItem {
  final String title;
  final String image;
  final String action;

  CourseItem({required this.title, required this.image, required this.action});

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      title: json['title'],
      image: json['image'],
      action: json['action'],
    );
  }
}

class LiveSession {
  final bool isLive;
  final String title;
  final String instructorName;
  final SessionDetails sessionDetails;
  final String action;

  LiveSession({
    required this.isLive,
    required this.title,
    required this.instructorName,
    required this.sessionDetails,
    required this.action,
  });

  factory LiveSession.fromJson(Map<String, dynamic> json) {
    return LiveSession(
      isLive: json['is_live'],
      title: json['title'],
      instructorName: json['instructor']['name'],
      sessionDetails: SessionDetails.fromJson(json['session_details']),
      action: json['action'],
    );
  }
}

class SessionDetails {
  final int sessionNumber;
  final String date;
  final String time;

  SessionDetails({
    required this.sessionNumber,
    required this.date,
    required this.time,
  });

  factory SessionDetails.fromJson(Map<String, dynamic> json) {
    return SessionDetails(
      sessionNumber: json['session_number'],
      date: json['date'],
      time: json['time'],
    );
  }
}
