import 'package:dio/dio.dart';
import 'package:suzanne_app/models/events.dart';

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

  Future<List<Event>> fetchEvents() async {
    try {
      final response = await _dio.get('/events');

      // Assuming the response data is in { "data": [...] }
      if (response.data is Map<String, dynamic> &&
          response.data['data'] is List<dynamic>) {
        return (response.data['data'] as List<dynamic>)
            .map((eventJson) => Event.fromJson(eventJson))
            .toList();
      } else if (response.data is List<dynamic>) {
        // Handle the case where it's a direct list
        return (response.data as List<dynamic>)
            .map((eventJson) => Event.fromJson(eventJson))
            .toList();
      } else {
        throw Exception(
            "Unexpected response type: ${response.data.runtimeType}");
      }
    } catch (e) {
      throw Exception("Failed to fetch events: $e");
    }
  }

  Future<Event> getEventDetail(String id) async {
    try {
      final response = await _dio.get('/events/$id');

      // Assuming the response data is in { "data": { ... } }
      if (response.data is Map<String, dynamic> &&
          response.data['data'] is Map<String, dynamic>) {
        return Event.fromJson(response.data['data']);
      } else if (response.data is Map<String, dynamic>) {
        // Handle direct event object
        return Event.fromJson(response.data);
      } else {
        throw Exception(
            "Unexpected response type: ${response.data.runtimeType}");
      }
    } catch (e) {
      throw Exception("Failed to fetch event detail: $e");
    }
  }
}
