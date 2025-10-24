import 'package:dio/dio.dart';
import 'package:shop_app_ws/data_providers/businees_ws/business_response.dart';

class BusinessClient {
  //
  final _dio = Dio();

  BusinessClient({
    required String baseUrl,
  }) {
    _dio.options.baseUrl = baseUrl;
  }

  Options _buildReqOptions(String? accessToken) {
    return Options(
      headers: {
        'Language': 'Fa',
        'Accept': 'application/json',
        'Content': 'application/json',
        'Content-Type': 'application/json',
        if (accessToken != null) 'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<BusinessResponse> get(
    String path, {
    String? param,
    Map<String, dynamic>? queryParams,
    String? accessToken,
  }) async {
    final res = await _dio.get(
      param == null ? path : '$path/$param',
      queryParameters: queryParams,
      options: _buildReqOptions(accessToken),
    );
    return BusinessResponse.fromMap(res.data);
  }

  Future<BusinessResponse> post(
    String path, {
    required Map<String, dynamic> data,
    String? accessToken,
  }) async {
    final res = await _dio.post(
      path,
      data: data,
      options: _buildReqOptions(accessToken),
    );
    return BusinessResponse.fromMap(res.data);
  }

  Future<BusinessResponse> put(
    String path, {
    String? param,
    required Map<String, dynamic> data,
    String? accessToken,
  }) async {
    final res = await _dio.put(
      param == null ? path : '$path/$param',
      data: data,
      options: _buildReqOptions(accessToken),
    );
    return BusinessResponse.fromMap(res.data);
  }

  Future<BusinessResponse> delete(
    String path, {
    required List<int> ids,
    String? accessToken,
  }) async {
    final res = await _dio.delete(
      path,
      data: {
        'ids': ids,
      },
      options: _buildReqOptions(accessToken),
    );
    return BusinessResponse.fromMap(res.data);
  }
}
