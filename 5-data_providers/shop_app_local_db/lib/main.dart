import 'package:flutter/material.dart';
import 'package:shop_app_local_db/data_providers/hive_db/hive_db.dart';
import 'package:shop_app_local_db/domains/store/store_box.dart';
import 'package:shop_app_local_db/domains/store/store_repository.dart';
import 'modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init(appName: App.name);
  final storeRepo = await StoreRepository.init();
  // await StoreBox.open();
  // await StoreBox.setFavs([1, 2, 3, 4]);
  // print(StoreBox.getFavs());

  // await StoreRepository.init();

  runApp(
    App(
      storeRepo: storeRepo,
    ),
  );
}
