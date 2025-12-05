import 'package:shop_app_auth/data_providers/businees_ws/business_ws.dart';
import 'package:shop_app_auth/domains/user/models/access_token.dart';
import 'package:shop_app_auth/domains/user/models/user.dart';
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

  Future<bool> otpConfirm({
    required String id,
    required String code,
  }) async {
    final res = await BusinessWS.client.post(
      BusinessWS.urls.otpConfirm,
      data: {
        'id': id,
        'code': code,
      },
    );
    final user = User.fromMap(res.data);
    if (user.isRegistered) {
      UserBox.setUser(user);
      UserBox.setToken(AccessToken(token: user.token!));
      return true;
    } else {
      return false;
    }
  }
}
