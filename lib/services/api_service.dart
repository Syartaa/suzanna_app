import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://suzanne-podcast.laratest-app.com/api',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  );

  Future<List<dynamic>> fetchPodcasts() async {
    try {
      final response = await _dio.get('/podcasts');
      return response.data; // Assuming the response is a list of podcasts
    } catch (e) {
      throw Exception("Failed to fetch podcasts: $e");
    }
  }

  Future<Map<String, dynamic>> getPodcastDetail(String id) async {
    try {
      final response = await _dio.get('/podcasts/$id');
      return response.data;
    } catch (e) {
      throw Exception("Failed to fetch podcast detail: $e");
    }
  }
}
