import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shop_app_ws/data_providers/businees_ws/business_ws.dart';
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

  try {
    // final a = 10;

    // final b = 0;

    // final res = a ~/ b;
    // print(res);
    // throw Exception('this is an Error!');
    throw 'dsdsadasdasda';
  } on Exception catch (error) {
    print('handling Exception!');
  } on Error catch (error) {
    print('handling Error!');
  } catch (error) {
    print(error.runtimeType);
    print('handling General Exceptoin!');
  } finally {
    print('finally exacuted!');
  }

  runApp(
    App(
      storeRepo: storeRepo,
    ),
  );
}
