import 'package:dio/dio.dart';

class BusinessClient {
  //
  final _dio = Dio();

  BusinessClient({
    required String baseUrl,
  }) {
    _dio.options.baseUrl = baseUrl;
  }

  Future<dynamic> get(
    String url, {
    String? param,
    Map<String, dynamic>? queryParams,
  }) async {
    final res = await _dio.get(
      param == null ? url : '$url/$param',
      queryParameters: queryParams,
    );
    return res;
  }
}
