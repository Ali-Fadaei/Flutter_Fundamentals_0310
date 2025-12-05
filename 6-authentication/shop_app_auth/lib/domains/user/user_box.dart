import 'package:shop_app_auth/domains/user/models/access_token.dart';
import 'package:shop_app_auth/domains/user/models/user.dart';

import '/data_providers/hive_db/hive_db.dart';

enum UserBoxKeys {
  user,
  accessToken,
}

abstract class UserBox {
  //
  static const name = 'user';

  static bool isOpen = false;

  static Future<void> open() async {
    if (!isOpen) {
      await HiveDB.openBox(name: name);
      isOpen = true;
    }
  }

  static Future<void> setUser(User value) async {
    await HiveDB.setValue(
      box: name,
      key: UserBoxKeys.user.index.toString(),
      value: value.toMap(),
    );
  }

  static User? getUser() {
    final res = HiveDB.getValue(
      box: name,
      key: UserBoxKeys.user.index.toString(),
    );
    return res == null ? null : User.fromMap(res);
  }

  static Future<void> setToken(AccessToken value) async {
    await HiveDB.setValue(
      box: name,
      key: UserBoxKeys.accessToken.index.toString(),
      value: value.toMap(),
    );
  }

  static AccessToken? getToken() {
    final res = HiveDB.getValue(
      box: name,
      key: UserBoxKeys.accessToken.index.toString(),
    );
    return res == null ? null : AccessToken.fromMap(res);
  }
}
