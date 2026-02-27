import 'dart:ui';

abstract class Theme {
  //
  //neutral colors
  static const background = Color(0XFFF6F6F6);
  //   static const background = Color(0xFF0C0D12);

  static const onBackground = Color(0XFF110E39);
  //   static const onBackground = Color(0xFFEDEFF5

  static const surface = Color(0XFFFEFEFE);
  //   static const surface = Color(0xFF171923);

  static const onSurface = Color(0XFF110E39);
  //   static const onSurface = Color(0xFFEDEFF5);

  static const outline = Color(0XFFE2E2E2);
  //   static const outline = Color(0xFF2F3442);

  static const outline2 = Color(0XFF7C7C7C);
  //   static const outline2 = Color(0xFF9AA0B5);

  //role colors
  static const primary = Color(0xFFF34E4E);
  //   static const primary = Color(0xFFFF6B6B);

  static const onPrimary = Color(0XFFFEFEFE);
  //   static const onPrimary = Color(0xFF111111);

  static const secondary = Color(0XFF110E39);
  // static const secondary = Color(0xFF8A9EF6);

  static const onSecondary = Color(0XFFFEFEFE);
  //   static const onSecondary = Color(0xFFFFFFFF);

  //Radius Amounts
  static const r10 = 10.0;

  static const r15 = 15.0;

  static const r20 = 20.0;

  //Ducations
  static const primaryDuration = Duration(milliseconds: 300);

  static const secondaryDuration = Duration(milliseconds: 500);
}
