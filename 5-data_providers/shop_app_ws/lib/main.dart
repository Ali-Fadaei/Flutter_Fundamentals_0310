import 'package:flutter/material.dart';
import '/data_providers/hive_db/hive_db.dart';
import '/domains/store/store_repository.dart';
import 'modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init(appName: App.name);
  final storeRepo = await StoreRepository.init();

  runApp(
    App(
      storeRepo: storeRepo,
    ),
  );
}
