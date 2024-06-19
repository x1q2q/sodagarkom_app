import '../core/core.dart';
import 'package:dio/dio.dart';

class NetworkService {
  String baseUrl = Core.appBaseURL;
  final Dio dio;

  NetworkService(this.baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await dio.get('$baseUrl/$endpoint');
      return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<Response> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post('$baseUrl/$endpoint', data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }
}
