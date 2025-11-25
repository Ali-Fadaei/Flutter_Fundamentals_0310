import '/data_providers/businees_ws/business_client.dart';
import '/data_providers/businees_ws/business_urls.dart';

abstract class BusinessWS {
  //
  static late final BusinessServers servers;

  static late final BusinessUrls urls;

  static late final BusinessClient client;

  static void init({
    String? customBaseUrl,
    Function(String message)? onError,
    Function()? onUnauthorized,
  }) {
    servers = BusinessServers();
    urls = BusinessUrls();
    client = BusinessClient(
      baseUrl: customBaseUrl ?? servers.current,
      onError: onError ?? (_) {},
      onUnauthorized: onUnauthorized ?? () {},
    );
  }
}
