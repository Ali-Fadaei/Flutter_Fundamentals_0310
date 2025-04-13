import 'package:flutter/material.dart';
import 'package:shop_uikit/ui_kit/ui_kit.dart' as U;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //
  bool laptopIsChecked = false;

  bool mobileIsChecked = false;

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ListView(
          children: [
            U.AppBar.primary(
              onMenuPressed: () {},
              onNotifPressed: () {},
            ),
            const SizedBox(
              height: 30,
            ),
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
            const SizedBox(height: 30),
            Row(
              children: [
                U.CheckBox(
                  title: 'لپ‌تاپ',
                  isChecked: laptopIsChecked,
                  onPressed: () {
                    laptopIsChecked = !laptopIsChecked;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                U.CheckBox(
                  title: 'موبایل',
                  isChecked: mobileIsChecked,
                  onPressed: () {
                    mobileIsChecked = !mobileIsChecked;
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                U.RadioButton<int>(
                  title: 'لپ‌تاپ',
                  value: 1,
                  groupValue: selectedCategory,
                  onPressed: () {
                    selectedCategory = 1;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                U.RadioButton<int>(
                  title: 'موبایل',
                  value: 2,
                  groupValue: selectedCategory,
                  onPressed: () {
                    selectedCategory = 2;
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
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
            const SizedBox(height: 15),
            U.OutlineButton(
              title: 'Outline',
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            U.OutlineButton(
              title: 'Outline',
              color: U.ButtonColor.secondary,
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            U.OutlineButton(
              title: 'Outline',
              color: U.ButtonColor.primary,
              size: U.ButtonSize.sm,
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            U.OutlineButton(
              title: 'Outline',
              color: U.ButtonColor.primary,
              size: U.ButtonSize.md,
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            U.OutlineButton(
              title: 'Outline',
              color: U.ButtonColor.primary,
              trailingText: 'fddsfdssdffds',
              size: U.ButtonSize.lg,
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            U.TextButton(
              title: 'Outline',
              color: U.ButtonColor.primary,
              size: U.ButtonSize.lg,
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            U.TextButton(
              title: 'Outline',
              color: U.ButtonColor.secondary,
              size: U.ButtonSize.lg,
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            U.IconButton(
              icon: U.Image.icon(
                path: U.Icons.store,
                color: U.Theme.onPrimary,
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 15),
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
