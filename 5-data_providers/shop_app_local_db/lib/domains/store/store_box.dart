import 'package:shop_app_local_db/data_providers/hive_db/hive_db.dart';

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

  static Future setFavs(List<int> value) async {
    await HiveDB.setValue(
      box: name,
      key: StoreKeys.favs.index.toString(),
      value: value,
    );
  }

  static List<int> getFavs() {
    return HiveDB.getValue(
      box: name,
      key: StoreKeys.favs.index.toString(),
    );
  }
}
