import 'package:shop_app_auth/data_providers/businees_ws/business_ws.dart';
import 'package:shop_app_auth/domains/user/user_box.dart';

class UserRepository {
  //
  static Future<UserRepository> init() async {
    await UserBox.open();
    return UserRepository();
  }

  Future<({String id, int expireTime})> otpGenerate({
    required String mobileNumber,
  }) async {
    //
    final res = await BusinessWS.client.post(
      BusinessWS.urls.otpGenerate,
      data: {
        "mobileNumber": mobileNumber,
      },
    );
    return (
      id: res.data['id'] as String,
      expireTime: res.data['expireTime'] as int
    );
  }
}
