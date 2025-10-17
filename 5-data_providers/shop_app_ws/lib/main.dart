import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_ws/data_providers/businees_ws/business_ws.dart';
import '/data_providers/hive_db/hive_db.dart';
import '/domains/store/store_repository.dart';
import 'modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init(appName: App.name);
  final storeRepo = await StoreRepository.init();

  // final dio = Dio();

  // dio.options.baseUrl = 'https://alifadaei.ir';

  // final res = await dio.get(
  //   '/product',
  //   queryParameters: {
  //     'minRate': 3,
  //     'maxRate': 5,
  //   },
  // );

  // print(res);

  BusinessWs.init();
  // BusinessWs.client;

  runApp(
    App(
      storeRepo: storeRepo,
    ),
  );
}
