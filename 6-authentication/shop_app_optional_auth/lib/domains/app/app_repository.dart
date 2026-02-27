import 'package:shop_app_optional_auth/domains/app/app_box.dart';
import 'package:shop_app_optional_auth/ui_kit/theme.dart';

class AppRepository {
  //
  static Future<AppRepository> init() async {
    await AppBox.open();
    return AppRepository();
  }

  int readTheme() {
    return AppBox.getTheme();
  }

  void updateTheme(int themeId) {
    AppBox.setTheme(themeId);
    Theme.changeMode(themeId);
  }
}
