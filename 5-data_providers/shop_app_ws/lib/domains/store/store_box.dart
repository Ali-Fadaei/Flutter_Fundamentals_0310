import 'package:shop_app_ws/domains/store/models/product.dart';

import '/data_providers/hive_db/hive_db.dart';

enum StoreKeys {
  favs,
}

abstract class StoreBox {
  //
  static const name = 'store';

  static bool isOpen = false;

  static Future<void> open() async {
    if (!isOpen) {
      await HiveDB.openBox(name: name);
      isOpen = true;
    }
  }

  static Future<void> setFavs(List<Product> value) async {
    await HiveDB.setValue(
      box: name,
      key: StoreKeys.favs.index.toString(),
      value: value.map((e) => e.toMap()).toList(),
    );
  }

  static List<Product> getFavs() {
    final res = HiveDB.getValue(
          box: name,
          key: StoreKeys.favs.index.toString(),
        ) ??
        [];
    final list = List.from(res);
    return List.from(res).map((e) => Product.fromMap(e)).toList();
  }
}
