import '/domains/store/models/product.dart';

import '/data_providers/hive_db/hive_db.dart';

enum AppKeys {
  themeId,
}

abstract class AppBox {
  //
  static const name = 'app';

  static bool isOpen = false;

  static Future<void> open() async {
    if (!isOpen) {
      await HiveDB.openBox(name: name);
      isOpen = true;
    }
  }

  static Future<void> setTheme(int value) async {
    await HiveDB.setValue(
      box: name,
      key: AppKeys.themeId.index.toString(),
      value: value,
    );
  }

  static int getTheme() {
    return HiveDB.getValue(
          box: name,
          key: AppKeys.themeId.index.toString(),
        ) ??
        -1;
  }
}
