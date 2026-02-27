import 'package:dio/dio.dart';
import '/data_providers/businees_ws/business_response.dart';

class BusinessClient {
  //
  final _dio = Dio();

  final Function(String message) onError;

  final Function() onUnauthorized;

  BusinessClient({
    required String baseUrl,
    required this.onError,
    required this.onUnauthorized,
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

  void _addErrorInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          try {
            error.response?.data =
                BusinessResponse.fromMap(error.response?.data);
          } catch (_) {}
          exceptionHandler(error);
          handler.next(error);
        },
      ),
    );
  }

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

  void exceptionHandler(DioException error) async {
    //
    final int? statusCode = error.response?.statusCode;
    if (error.type == DioExceptionType.connectionError) {
      onError('عدم اتصال به شبکه');
      throw Exception('network Error! can\'t connect to network.');
    } else if (error.type == DioExceptionType.badCertificate) {
      onError('عدم امکان اتصال امن');
      throw Exception('https certificate error!');
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      onError('سرویس پاسخگو نبود');
      throw Exception(
        'connection timeout! (${error.requestOptions.connectTimeout})ms',
      );
    } else if (error.type == DioExceptionType.unknown) {
      onError(
        'مشکل ناشناس در برقراری ارتباط با سرویس رخ داد',
      );
      throw Exception(error.message);
    } else if (statusCode == 401) {
      onUnauthorized();
      await Future.delayed(const Duration(milliseconds: 50));
      onError('کلید دسترسی شما منقضی شده است');
      throw Exception('access token expired! (401)');
    } else if (statusCode == 403) {
      onError('دسترسی مجاز نمی باشد');
      throw Exception('access denied! (403)');
    } else if (statusCode == 404) {
      onError('یافت نشد!');
      throw Exception('Not Found! (404)');
    } else if (statusCode == 500) {
      onError(
        'مشکل داخلی در سرویس رخ داده',
      );
      throw Exception('internal server error! (500)');
    } else if (statusCode == 502) {
      onError('502: سرویس در دسترس نمی باشد');
      throw Exception(error);
    } else if (statusCode == 503) {
      onError('503: سرور در دسترس نمی باشد');
      throw Exception(error);
    } else if (error.response?.data.message?.general != null &&
        error.response?.data?.message.general != '') {
      onError(error.response?.data.message?.general);
      throw Exception(
        'Web-Service Error! Status: ${error.response?.statusCode} - Msg:${error.response?.data.message}',
      );
    }
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
    try {
      final res = await _dio.post(
        path,
        data: data,
        options: _buildReqOptions(accessToken),
      );
      return res.data;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return e.response!.data;
      } else {
        rethrow;
      }
    }
  }

  Future<BusinessResponse> put(
    String path, {
    String? param,
    required Map<String, dynamic> data,
    String? accessToken,
  }) async {
    try {
      final res = await _dio.put(
        param == null ? path : '$path/$param',
        data: data,
        options: _buildReqOptions(accessToken),
      );
      return res.data;
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return e.response!.data;
      } else {
        rethrow;
      }
    }
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
