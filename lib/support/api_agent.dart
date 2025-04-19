import 'package:dio/dio.dart';

class ApiAgent {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Accept': 'application/json'},
      responseType: ResponseType.json,
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  static Future<Response> get({required String url, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw Exception('GET request failed: ${e.message}');
    }
  }

  static Future<Response> post({required String url, dynamic data, Map<String, dynamic>? headers, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.post(url, data: data, options: Options(headers: headers));
      return response;
    } on DioException catch (e) {
      throw Exception('POST request failed: ${e.message}');
    }
  }
}
