import '/tool_kit/tool_kit.dart' as T;

class BusinessServers {
  //
  final develop = 'https://alifadaei.com';

  final stable = 'https://alifadaei.com';

  String get current => T.Utils.isDebug ? develop : stable;
}

class BusinessUrls {
  //
  final productCategory = '/product-category';

  final product = '/product';

  final favorite = '/client/favorite';
}
