import 'package:flutter/material.dart';

class ConditionalMergeBuilder extends StatelessWidget {
  //
  final bool condition;

  final Widget Function(Widget child) mergeBuilder;

  final Widget child;

  const ConditionalMergeBuilder({
    super.key,
    required this.condition,
    required this.mergeBuilder,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return condition ? mergeBuilder(child) : child;
  }
}
