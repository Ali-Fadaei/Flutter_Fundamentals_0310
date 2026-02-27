import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';

abstract class Theme {
  //
  static late final BuildContext rootContext;

  static bool isDark = platformIsDark;

  static Timer? timer;

  static void init(BuildContext context, int initialMode) {
    rootContext = context;
    changeMode(initialMode);
  }

  static get platformIsDark =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;

  static void _enbaleAutoTheme() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      bool temp = platformIsDark;
      if (temp != isDark) {
        isDark = temp;
        _rebuildAllChildren(rootContext);
      }
    });
  }

  static void _disableAutoTheme() {
    timer?.cancel();
    timer = null;
  }

  static void _rebuildAllChildren(BuildContext context) {
    //
    void rebuilder(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuilder);
    }

    (context as Element).visitChildren(rebuilder);
  }

  // -1 => auto
  // 0 => dark
  // 1 => light
  static void changeMode(int mode) {
    bool temp = isDark;
    switch (mode) {
      case -1:
        temp = platformIsDark;
        _enbaleAutoTheme();
        break;
      case 0:
        temp = true;
        _disableAutoTheme();
        break;
      case 1:
        temp = false;
        _disableAutoTheme();
        break;
    }

    if (temp != isDark) {
      isDark = temp;
      _rebuildAllChildren(rootContext);
    }
  }

  //neutral colors
  static Color get background => isDark ? Color(0xFF0C0D12) : Color(0XFFF6F6F6);

  static Color get onBackground =>
      isDark ? Color(0xFFEDEFF5) : Color(0XFF110E39);

  static Color get surface => isDark ? Color(0xFF171923) : Color(0XFFFEFEFE);

  static Color get onSurface => isDark ? Color(0xFFEDEFF5) : Color(0XFF110E39);

  static Color get outline => isDark ? Color(0xFF2F3442) : Color(0XFFE2E2E2);

  static Color get outline2 => isDark ? Color(0xFF9AA0B5) : Color(0XFF7C7C7C);

  //role colors
  static Color get primary => isDark ? Color(0xFFFF6B6B) : Color(0xFFF34E4E);

  static Color get onPrimary => isDark ? Color(0xFF111111) : Color(0XFFFEFEFE);

  static Color get secondary => isDark ? Color(0xFF8A9EF6) : Color(0XFF110E39);

  static Color get onSecondary =>
      isDark ? Color(0xFFFFFFFF) : Color(0XFFFEFEFE);

  //Radius Amounts
  static const r10 = 10.0;

  static const r15 = 15.0;

  static const r20 = 20.0;

  //Ducations
  static const primaryDuration = Duration(milliseconds: 300);

  static const secondaryDuration = Duration(milliseconds: 500);
}
