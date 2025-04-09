import 'package:flutter/material.dart';
import 'package:shop_uikit/ui_kit/ui_kit.dart' as U;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            U.Image(
              path: U.Images.emptyFav,
              height: 80,
              width: 120,
            ),
            const SizedBox(
              height: 30,
            ),
            U.Image.icon(
              path: U.Icons.store,
              size: 48,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 30,
            ),
            U.Button(
              title: 'خرید ',
              size: U.ButtonSize.lg,
              color: U.ButtonColor.primary,
              disabled: false,
              trailingText: '1500000 تومان',
              onPressed: () {
                print('button pressed!');
              },
            ),
            const SizedBox(height: 15),
            U.Button(
              title: 'خرید ',
              size: U.ButtonSize.md,
              color: U.ButtonColor.primary,
              onPressed: () {
                print('button pressed!');
              },
            ),
            const SizedBox(height: 15),
            U.Button(
              title: 'خرید ',
              size: U.ButtonSize.sm,
              color: U.ButtonColor.primary,
              onPressed: () {
                print('button pressed!');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            U.Button(
              title: 'خرید ',
              size: U.ButtonSize.lg,
              color: U.ButtonColor.secondary,
              onPressed: () {
                print('button pressed!');
              },
            ),
            const SizedBox(height: 15),
            U.Button(
              title: 'خرید ',
              size: U.ButtonSize.md,
              color: U.ButtonColor.secondary,
              onPressed: () {
                print('button pressed!');
              },
            ),
            const SizedBox(height: 15),
            U.Button(
              title: 'خرید ',
              size: U.ButtonSize.sm,
              color: U.ButtonColor.secondary,
              onPressed: () {
                print('button pressed!');
              },
            ),
            const SizedBox(height: 30),
            U.NetworkImage(
              url:
                  'https://fadaei-storage.storage.iran.liara.space/shop_app/banners/banner_1.jpg',
            ),
            U.Text(
              'متن تستی شماره 1',
              size: U.TextSize.s12,
              font: U.TextFont.yekan,
              weight: U.TextWeight.regular,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
