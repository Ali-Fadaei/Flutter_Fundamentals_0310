//null -> remove
//'' -> null
import 'package:dio/dio.dart';

//null -> remove
//'' -> null
Map<String, dynamic> nullKiller(Map<String, dynamic>? map) {
  Map<String, dynamic> temp = {};
  map?.forEach((key, value) {
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
    onUnAuthorized();
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
  } else if (error.response?.data.message != null &&
      error.response?.data?.message != '') {
    onError(error.response?.data.message);
    throw Exception(
      'Web-Service Error! Status: ${error.response?.statusCode} - Msg:${error.response?.data.message}',
    );
  }
}

void onError(String message) {}
void onUnAuthorized() {}
