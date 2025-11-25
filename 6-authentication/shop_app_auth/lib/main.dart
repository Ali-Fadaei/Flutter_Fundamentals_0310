import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import '/data_providers/businees_ws/business_ws.dart';
import '/data_providers/hive_db/hive_db.dart';
import '/domains/store/store_repository.dart';
import 'modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init(appName: App.name);
  final storeRepo = await StoreRepository.init();
  BusinessWS.init(
    onUnauthorized: () {},
    onError: (message) {
      toast(message);
    },
  );

  runApp(
    App(
      storeRepo: storeRepo,
    ),
  );
}
