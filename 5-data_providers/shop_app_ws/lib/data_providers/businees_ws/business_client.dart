import 'package:dio/dio.dart';
import 'package:shop_app_ws/data_providers/businees_ws/business_response.dart';

class BusinessClient {
  //
  final _dio = Dio();

  BusinessClient({
    required String baseUrl,
  }) {
    _dio.options.baseUrl = baseUrl;
    _addReqInterceptor();
    _addResInterceptor();
    _addErrorInterceptor();
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

  void _addReqInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (req, handler) {
          req.data = nullKiller(req.data);
          req.queryParameters = qpNullKiller(req.queryParameters);
          handler.next(req);
        },
      ),
    );
  }

  void _addResInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          response.data = BusinessResponse.fromMap(response.data);
          handler.next(response);
        },
      ),
    );
  }

  void _addErrorInterceptor() {}

//null -> remove
//'' -> null
  Map<String, dynamic>? nullKiller(Map<String, dynamic>? map) {
    if (map == null) return null;
    Map<String, dynamic> temp = {};
    map.forEach((key, value) {
      if (value is String) value = value.trim();
      if (value != null) {
        if (value == '') {
          temp[key] = null;
        } else if (value.runtimeType == Map) {
          temp[key] = nullKiller(value);
        } else {
          temp[key] = value;
        }
      }
    });
    return temp;
  }

//null -> remove
//'' -> remove
  Map<String, dynamic> qpNullKiller(Map<String, dynamic>? map) {
    Map<String, dynamic> temp = {};
    map?.forEach((key, value) {
      if (value is String) value = value.trim();
      if (value != null && value != '') {
        if (value.runtimeType == Map) {
          temp[key] = qpNullKiller(value);
        } else {
          temp[key] = value;
        }
      }
    });
    return temp;
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
    return res.data;
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
    return res.data;
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
    return res.data;
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
    return res.data;
  }
}
