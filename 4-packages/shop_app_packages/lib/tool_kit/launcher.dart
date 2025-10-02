import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class Launcher {
  //
  //'https://alifadaei.ir'
  static Future<void> launchWeb(String url) async {
    if (await canLaunchUrlString(url)) {
      launchUrlString(url);
    }
  }

  static Future<void> launchTel(String telNumber) async {
    final uri = Uri(
      scheme: 'tel',
      host: telNumber,
    );
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }

  static Future<void> launchSms({
    required String telNumber,
    required String message,
  }) async {
    final uri = Uri(
      scheme: 'sms',
      host: telNumber,
      query: message,
    );
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }
}
