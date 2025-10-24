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
    String path, {
    String? param,
    Map<String, dynamic>? queryParams,
  }) async {
    final res = await _dio.get(
      param == null ? path : '$path/$param',
      queryParameters: queryParams,
      options: Options(
        headers: {
          'Language': 'Fa',
          'Accept': 'application/json',
          'Content': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer Token',
        },
      ),
    );
    return res.data;
  }

  Future<dynamic> post(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    final res = await _dio.post(
      path,
      data: data,
      options: Options(
        headers: {
          'Language': 'Fa',
          'Accept': 'application/json',
          'Content': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer Token',
        },
      ),
    );
    return res.data;
  }

  Future<dynamic> put(
    String path, {
    String? param,
    required Map<String, dynamic> data,
  }) async {
    final res = await _dio.put(
      param == null ? path : '$path/$param',
      data: data,
      options: Options(
        headers: {
          'Language': 'Fa',
          'Accept': 'application/json',
          'Content': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer Token',
        },
      ),
    );
    return res.data;
  }

  Future<dynamic> delete(
    String path, {
    required List<int> ids,
  }) async {
    final res = await _dio.delete(
      path,
      data: {
        'ids': ids,
      },
      options: Options(
        headers: {
          'Language': 'Fa',
          'Accept': 'application/json',
          'Content': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer Token',
        },
      ),
    );
    return res.data;
  }
}
