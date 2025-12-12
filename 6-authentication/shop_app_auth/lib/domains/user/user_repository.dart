import 'dart:async';

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

  final _jwtAuthStreamCtrl = StreamController<bool>.broadcast();

  Stream<bool> get jwtAuthStream => _jwtAuthStreamCtrl.stream;

  bool checkJwtAuth() {
    final accesstoken = UserBox.getToken();
    return accesstoken?.token.isNotEmpty ?? false;
  }

  Future<String> readAccessToken() async {
    final accessToken = UserBox.getToken();
    final token = accessToken?.token;
    if (token != null) {
      // return token;
      return 'dadsadjashdjkhsad';
    } else {
      _jwtAuthStreamCtrl.add(false);
      throw Exception('Token Not Found!');
    }
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
      _jwtAuthStreamCtrl.add(true);
      return true;
    } else {
      return false;
    }
  }

  Future<void> otpRegister({
    required String hashId,
    required String firstName,
    required String lastName,
    required String email,
    required String address,
  }) async {
    final res = await BusinessWS.client.put(
      BusinessWS.urls.otpRegister,
      data: {
        'id': hashId,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
      },
    );
    final user = User.fromMap(res.data);
    UserBox.setUser(user);
    UserBox.setToken(AccessToken(token: user.token!));
    _jwtAuthStreamCtrl.add(true);
  }

  Future<void> logout() async {
    UserBox.setToken(null);
    UserBox.setUser(null);
    _jwtAuthStreamCtrl.add(false);
    try {
      final token = await readAccessToken();
      await BusinessWS.client.post(
        BusinessWS.urls.logout,
        accessToken: token,
        data: {},
      );
    } catch (_) {}
  }
}
