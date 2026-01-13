import 'package:dio/dio.dart';
import 'package:trogon_learning_app/modules/dashboard/model/home_model.dart';
import 'package:trogon_learning_app/modules/video_player_screen/model/video_model.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://trogon.info/task/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Generic GET
  static Future<Response> get(String endpoint) async {
    return await _dio.get(endpoint);
  }

  // Home API (typed)
  static Future<HomeModel> fetchHome() async {
    final response = await _dio.get('home.php');

    if (response.statusCode == 200 && response.data != null) {
      return HomeModel.fromJson(response.data);
    } else {
      throw Exception('Home API failed');
    }
  }

  // Video Details API
  static Future<VideoListResponse> fetchVideoDetails() async {
    final response = await _dio.get('video_details.php');

    if (response.statusCode == 200 && response.data != null) {
      return VideoListResponse.fromJson(response.data);
    } else {
      throw Exception('Video Details API failed');
    }
  }
}
