import 'package:flutter/material.dart';
import 'package:widgets/custom_widget.dart';

class RowLayout extends StatelessWidget {
  //
  const RowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            CustomWidget(
              color: Colors.red,
              height: 100,
            ),
            CustomWidget(
              color: Colors.blue,
              height: 200,
            ),
            CustomWidget(
              color: Colors.green,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
