import 'package:dio/dio.dart';

class NetworkService {
  final String baseUrl;
  final Dio dio;

  NetworkService(this.baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
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

// class NetworkService {
//   final Dio _dio;

//   NetworkService()
//       : _dio = Dio(BaseOptions(
//           baseUrl: Core.appBaseURL,
//           connectTimeout: const Duration(milliseconds: 5000),
//           receiveTimeout: const Duration(milliseconds: 3000),
//         ));

//   Future<Response> getRequest(String endpoint) async {
//     try {
//       print(endpoint);
//       final response = await _dio.get(endpoint);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
