import 'package:flutter/material.dart';
import 'package:shop_app_ws/data_providers/businees_ws/business_ws.dart';
import '/data_providers/hive_db/hive_db.dart';
import '/domains/store/store_repository.dart';
import 'modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init(appName: App.name);
  final storeRepo = await StoreRepository.init();
  BusinessWS.init();

  runApp(
    App(
      storeRepo: storeRepo,
    ),
  );
}
