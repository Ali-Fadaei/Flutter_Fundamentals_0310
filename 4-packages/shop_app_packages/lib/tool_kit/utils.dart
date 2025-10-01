import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

abstract class Utils {
  //
  static bool isRelease = kReleaseMode;

  static bool isDebug = kDebugMode;

  static bool isWeb = kIsWeb;

  static final platform = Platform.operatingSystem;

  static bool isWindows = Platform.isWindows;
  // static bool isWindows = Platform.isWindows;

  static bool isNativeWindows = isWindows && !isWeb;

  static bool isWebeWindows = isWindows && isWeb;

  static bool isLinux = Platform.isLinux;

  static bool isNativeLinux = isLinux && !isWeb;

  static bool isWebLinux = isLinux && isWeb;

  static bool isMacOs = Platform.isMacOS;

  static bool isNativeMacOs = isMacOs && !isWeb;

  static bool isWebMacOs = isMacOs && isWeb;

  static bool isAndroid = Platform.isAndroid;

  static bool isNativeAndroid = isAndroid && !isWeb;

  static bool isWebAndroid = isAndroid && isWeb;

  static bool isIos = Platform.isIOS;

  static bool isNativeIos = isIos && !isWeb;

  static bool isWebIos = isIos && isWeb;

  //compare = '2.0.10' current = '2.2.0'
  static Future<bool> needToUpdate(String compareVersion) async {
    //
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    final splittedCompareVersion = compareVersion.split('.'); // ['1','2','3']
    final splittedCurrentVersion = currentVersion.split('.'); // ['0','1','0']

    final compareMajor = int.parse(splittedCompareVersion[0]);
    final compareMinor = int.parse(splittedCompareVersion[1]);
    final comparePatch = int.parse(splittedCompareVersion[2]);

    final currentMajor = int.parse(splittedCompareVersion[0]);
    final currentMinor = int.parse(splittedCurrentVersion[1]);
    final currentPatch = int.parse(splittedCurrentVersion[2]);

    if (compareMajor > currentMajor) {
      return true;
    } else if (compareMajor == currentMajor && compareMinor > currentMinor) {
      return true;
    } else if (compareMajor == currentMajor &&
        compareMinor == currentMinor &&
        comparePatch > currentPatch) {
      return true;
    }

    return false;
  }

  static Future<String> getDeviceUid() async {
    final deviceInfo = DeviceInfoPlugin();
    if (isWeb) {
      final webInfo = await deviceInfo.webBrowserInfo;
      return '${webInfo.deviceMemory}-${webInfo.hardwareConcurrency}-${webInfo.vendor}-${webInfo.browserName.toString()}';
    } else {
      switch (platform) {
        case 'windows':
          final winInfo = await deviceInfo.windowsInfo;
          return '${winInfo.deviceId}-${winInfo.userName}';
        case 'linux':
          final linuxInfo = await deviceInfo.linuxInfo;
          return '${linuxInfo.machineId}';
        case 'macos':
          final macInfo = await deviceInfo.macOsInfo;
          return '${macInfo.computerName}-${macInfo.memorySize}';

        case 'android':
          final androidInfo = await deviceInfo.androidInfo;
          return androidInfo.bootloader;
        case 'ios':
          final iosInfo = await deviceInfo.iosInfo;
          return '${iosInfo.identifierForVendor}';
        default:
          return 'A86242fs81d2g1483l17220gd3238i18245fc3hb2m1gfd41h2424787';
      }
    }
  }
}
