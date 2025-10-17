import 'package:dio/dio.dart';
import 'package:shop_app_ws/data_providers/businees_ws/business_urls.dart';

class BusinessClient {
  //
  final _dio = Dio();

  BusinessClient({
    required String baseUrl,
  }) {
    _dio.options.baseUrl = baseUrl;
  }

  Future<dynamic> get(
    String endPoint, {
    String? param,
    Map<String, dynamic>? queryParams,
  }) {
    final res = _dio.get(
      param == null ? endPoint : '$endPoint/$param',
      queryParameters: queryParams,
    );
    return res;
  }
}
