import 'package:flutter/material.dart';
import '/ui_kit/ui_kit.dart' as U;

class CategoryBottomShett extends StatefulWidget {
  static void show({
    required BuildContext context,
    //required Widget builder,
  }) {
    U.BottomSheet.show(builder: (context) => CategoryBottomShett(), context);
  }

  const CategoryBottomShett({super.key});
  @override
  State<CategoryBottomShett> createState() => _CategoryBottomShettState();
}

class _CategoryBottomShettState extends State<CategoryBottomShett> {
  bool mobile = false;
  double imtiyazSlider = 0;
  double gimatSlider = 0;
  bool laptop = false;
  bool handsferi = false;
  String heshzat = '';
  bool abzar = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            U.Text('text'),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 11,
        ),
        U.Text('imtiyaz  based:'),
        //Todo:
        U.Slider(
          divisions: 5,
          color: U.Theme.primary,
          value: imtiyazSlider,
          onChanged: (amount) {
            imtiyazSlider = amount;
            setState(() {});
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Row(
            children: [
              U.Text('0'),
              Spacer(),
              U.Text('5'),
            ],
          ),
        ),
        SizedBox(
          height: 11,
        ),
        //Todo:
        U.Text('gimat based:'),
        SizedBox(
          height: 11,
        ),
        U.Slider(
          color: U.Theme.primary,
          value: gimatSlider,
          onChanged: (amount) {
            gimatSlider = amount;
            setState(() {});
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Row(
            children: [
              U.Text('0'),
              Spacer(),
              U.Text('50000000'),
            ],
          ),
        ),
        SizedBox(
          height: 11,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            U.CheckBox(
                title: 'mobile',
                isChecked: mobile,
                onPressed: () {
                  mobile = !mobile;
                  setState(() {});
                }),
            U.CheckBox(
                title: 'laptop',
                isChecked: laptop,
                onPressed: () {
                  laptop = !laptop;
                  setState(() {});
                }),
            U.CheckBox(
                title: 'handsfri',
                isChecked: handsferi,
                onPressed: () {
                  handsferi = !handsferi;
                  setState(() {});
                }),
            U.CheckBox(
                title: 'abzar',
                isChecked: abzar,
                onPressed: () {
                  abzar = !abzar;
                  setState(() {});
                })
          ],
        ),
        SizedBox(
          height: 11,
        ),

        U.Text('fas'),
        SizedBox(
          height: 11,
        ),

        Row(
          children: [
            U.RadioButton(
                title: 'gimat',
                value: 'gimat',
                groupValue: heshzat,
                onPressed: (value) {
                  heshzat = value;
                  setState(() {});
                }),
            VerticalDivider(
              width: 10,
              thickness: 12,
            ),

            U.RadioButton(
                title: 'imtiyaz',
                value: 'imtiyaz',
                groupValue: heshzat,
                onPressed: (value) {
                  heshzat = value;
                  setState(() {});
                }),
            SizedBox(
              width: 11,
            ),
            SizedBox(
              height: 44,
              child: Divider(
                thickness: 1,
                height: 34,
              ),
            ),
            // VerticalDivider(
            //   thickness: 1,
            // ),
            // Divider(
            //   //thickness: 1,
            //   height: 5,
            // ),
            SizedBox(
              width: 11,
            ),
            // U.RadioButton(
            //     title: 'vertical',
            //     value: value,
            //     groupValue: groupValue,
            //     onPressed: onPressed),
            // U.RadioButton(
            //     title: 'horizontal',
            //     value: value,
            //     groupValue: groupValue,
            //     onPressed: onPressed),
          ],
        ),
        U.Button(color: U.ButtonColor.primary, title: 'title', onPressed: () {})
      ],
    );
  }
}
