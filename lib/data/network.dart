import 'package:dio/dio.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

class NetworkService {
  final String baseUrl;
  final Dio dio;

  NetworkService(this.baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> fetchData(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw Exception(e.response!.data['message']);
        } else {
          throw Exception('Failed to update data: ${e.response!.data}');
        }
      } else {
        // handling network error
        throw Exception('Failed to fetch data: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<Response> insertData(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post('$baseUrl/$endpoint', data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to insert data: $e');
    }
  }

  Future<Response> updateData(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.put('$baseUrl/$endpoint', data: data);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400 ||
            e.response!.statusCode == 409 ||
            e.response!.statusCode == 500) {
          throw Exception(e.response!.data['message']);
        } else {
          throw Exception('Failed to update data: ${e.response!.data}');
        }
      } else {
        // handling network error
        throw Exception('Failed to update data: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to update data: $e');
    }
  }

  Future<Response> uploadImage(
      String endpoint, Map<String, dynamic> objData, File filePhoto) async {
    try {
      String fileName = filePhoto.path.split('/').last;
      var fileExt = fileName.split('.').last;
      Map<String, dynamic> imgData = {
        'file': await MultipartFile.fromFile(filePhoto.path,
            filename: fileName, contentType: MediaType("image", fileExt))
      };

      FormData formData = FormData.fromMap({...objData, ...imgData});

      final response = await dio.post('$baseUrl/$endpoint', data: formData);
      return response;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
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
// Future<Response> deleteData(
//     String endpoint, Map<String, dynamic> data) async {
//   try {
//     final response = await dio.delete('$baseUrl/$endpoint', data: data);
//     return response;
//   } catch (e) {
//     throw Exception('Failed to fetch data: $e');
//   }
// }
// }
