import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class BottomSheet extends StatelessWidget {
  //
  static show(
    BuildContext context, {
    double? maxWidth,
    double? maxHeight,
    bool useRootNavigator = false,
    EdgeInsets padding = const EdgeInsets.all(12),
    required Widget Function(BuildContext context) builder,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: useRootNavigator,
      barrierColor: Colors.black54,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? 1024,
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.80,
      ),
      builder: (context) {
        return U.BottomSheet(
          padding: padding,
          child: builder(context),
        );
      },
    );
  }

  final Widget child;
  final EdgeInsets padding;
  const BottomSheet({
    super.key,
    required this.child,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: U.Theme.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(U.Theme.r20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 5,
            width: 70,
            decoration: BoxDecoration(
              color: U.Theme.outline2,
              borderRadius: BorderRadius.circular(U.Theme.r15),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}
