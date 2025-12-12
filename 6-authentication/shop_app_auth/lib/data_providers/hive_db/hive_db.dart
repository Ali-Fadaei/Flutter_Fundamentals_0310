import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as P;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_io/io.dart';
import '/tool_kit/tool_kit.dart' as T;

abstract class HiveDB {
  //
  static Future<List<int>> _getEnc() async {
    //
    final sp = await SharedPreferences.getInstance();
    final deviceUID = await T.Utils.getDeviceUid();
    final secKey = sp
        .getStringList(deviceUID)
        ?.map(
          (e) => (int.parse(e) - 2),
        )
        .toList();
    if (secKey == null) {
      return _setEnc();
    }
    return secKey;
  }

  static Future<List<int>> _setEnc() async {
    //
    final secKey = Hive.generateSecureKey();
    final deviceUID = await T.Utils.getDeviceUid();
    final sp = await SharedPreferences.getInstance();
    sp.setStringList(
      deviceUID,
      secKey.map((e) => (e + 2).toString()).toList(),
    );
    return secKey;
  }

  static Future<void> init({required String appName}) async {
    if (T.Utils.isWeb) {
      Hive.init('');
    } else {
      final docDir = await P.getApplicationDocumentsDirectory();
      final appDir = await Directory('${docDir.path}/$appName').create();
      Hive.init(appDir.path);
    }
  }

  static Future<void> openBox({required String name}) async {
    await Hive.openBox(
      name,
      crashRecovery: true,
      encryptionCipher: HiveAesCipher(
        await _getEnc(),
      ),
    );
  }

  static Future<void> setValue<T>({
    required String box,
    required String key,
    required T value,
  }) async {
    if (!Hive.isBoxOpen(box)) {
      throw '$box not found. Open the Box!';
    }
    await Hive.box(box).put(key, value);
  }

  static T getValue<T>({
    required String box,
    required String key,
  }) {
    if (!Hive.isBoxOpen(box)) {
      throw '$box not found. Open the Box!';
    }
    return Hive.box(box).get(key);
  }
}
