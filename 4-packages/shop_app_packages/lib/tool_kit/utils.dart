import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart';

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
}
