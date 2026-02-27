import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shop_app_optional_auth/domains/app/app_repository.dart';
import '/domains/user/user_repository.dart';
import '/modules/app/cubit/app_cubit.dart';
import '/data_providers/businees_ws/business_ws.dart';
import '/data_providers/hive_db/hive_db.dart';
import '/domains/store/store_repository.dart';
import 'modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init(appName: App.name);
  final appRepo = await AppRepository.init();
  final storeRepo = await StoreRepository.init();
  final userRepo = await UserRepository.init();
  final appCubit = AppCubit(appRepo: appRepo, userRepo: userRepo);
  BusinessWS.init(
    onUnauthorized: () {
      appCubit.onLogout();
    },
    onError: (message) {
      toast(message);
    },
  );

  runApp(
    App(
      appRepo: appRepo,
      userRepo: userRepo,
      storeRepo: storeRepo,
      appCubit: appCubit,
    ),
  );
}
