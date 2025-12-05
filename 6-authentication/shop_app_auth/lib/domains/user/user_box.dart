import '/domains/store/models/product.dart';

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

  static Future<void> setFavs(List<Product> value) async {
    // await HiveDB.setValue(
    //   box: name,
    //   key: UserBoxKeys.favs.index.toString(),
    //   value: value.map((e) => e.toMap()).toList(),
    // );
  }

  static List<Product> getFavs() {
    // final res = HiveDB.getValue(
    //       box: name,
    //       key: UserBoxKeys.favs.index.toString(),
    //     ) ??
    //     [];
    // final list = List.from(res);
    // return List.from(res).map((e) => Product.fromMap(e)).toList();
    return [];
  }
}
