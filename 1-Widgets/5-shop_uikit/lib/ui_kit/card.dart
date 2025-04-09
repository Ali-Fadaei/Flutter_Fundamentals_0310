import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class Card extends StatelessWidget {
  //
  final double? height;

  final double? width;

  final Widget child;

  const Card({
    super.key,
    this.height,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: U.Theme.surface,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          U.Theme.r20,
        ),
        border: Border.all(
          width: 1.0,
          color: U.Theme.outline2,
        ),
      ),
      child: child,
    );
  }
}
