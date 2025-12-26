import '/tool_kit/tool_kit.dart' as T;

class BusinessServers {
  //
  final develop = 'http://localhost:3000';

  final stable = 'https://alifadaei.ir';

  String get current => T.Utils.isDebug ? develop : stable;
}

class BusinessUrls {
  //
  final otpGenerate = '/client/otp/generate';

  final otpConfirm = '/client/otp/confirm';

  final otpRegister = '/client/otp/register';

  final refreshToken = '/client/auth/refresh';

  final logout = '/client/auth/logout';

  final productCategory = '/product-category';

  final product = '/product';

  final favorite = '/client/favorite';
}
