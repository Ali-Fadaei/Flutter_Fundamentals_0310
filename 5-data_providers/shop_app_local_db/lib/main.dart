import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shop_app_local_db/data_providers/hive_db/hive_db.dart';
import 'modules/app/app.dart';

void main() async {
  await HiveDB.init(appName: App.name);
  await HiveDB.openBox(name: 'test');
  await HiveDB.setValue(
    box: 'test',
    key: 'string',
    value: 'Ali',
  );

  final returnedValue = HiveDB.getValue(
    box: 'test',
    key: 'string',
  );
  print(returnedValue);
  print('---------------------------------');
  await HiveDB.setValue(
    box: 'test',
    key: 'int',
    value: 1234,
  );
  final returnedValue1 = HiveDB.getValue(
    box: 'test',
    key: 'int',
  );
  print(returnedValue1);
  print('---------------------------------');
  await HiveDB.setValue(
    box: 'test',
    key: 'double',
    value: 12.34,
  );
  final returnedValue2 = HiveDB.getValue(
    box: 'test',
    key: 'double',
  );
  print(returnedValue2);
  print('---------------------------------');
  await HiveDB.setValue(
    box: 'test',
    key: 'bool',
    value: true,
  );
  final returnedValue3 = HiveDB.getValue(
    box: 'test',
    key: 'bool',
  );
  print(returnedValue3);
  print('---------------------------------');
  await HiveDB.setValue(
    box: 'test',
    key: 'list-string',
    value: ['Ali', 'erfan'],
  );

  final returnedValue4 = HiveDB.getValue(
    box: 'test',
    key: 'list-string',
  );
  print(returnedValue4);
  print('---------------------------------');
  await HiveDB.setValue(
    box: 'test',
    key: 'list-int',
    value: [1234, 56789],
  );
  final returnedValue5 = HiveDB.getValue(
    box: 'test',
    key: 'list-int',
  );
  print(returnedValue5);
  print('---------------------------------');
  await HiveDB.setValue(
    box: 'test',
    key: 'list-double',
    value: [12.34, 3.14],
  );
  final returnedValue6 = HiveDB.getValue(
    box: 'test',
    key: 'list-double',
  );
  print(returnedValue6);
  print('---------------------------------');
  await HiveDB.setValue(
    box: 'test',
    key: 'list-bool',
    value: [true, false, true, false],
  );
  final returnedValue7 = HiveDB.getValue(
    box: 'test',
    key: 'list-bool',
  );
  print(returnedValue7);
  print('---------------------------------');

  runApp(const App());
}
