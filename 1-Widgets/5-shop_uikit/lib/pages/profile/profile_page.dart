import 'package:flutter/material.dart';
import 'package:shop_uikit/ui_kit/text.dart' as U;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: U.Text(
        'متن تستی شماره 1',
        size: U.TextSize.s12,
        font: U.TextFont.yekan,
        weight: U.TextWeight.regular,
      ),
    );
  }
}
