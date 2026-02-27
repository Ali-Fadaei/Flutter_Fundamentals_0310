import 'package:flutter/material.dart' as M;
import './ui_kit.dart' as U;

class RefreshIndicator extends M.StatelessWidget {
  //
  final M.Widget child;

  final double edgeOffset;

  final Future<void> Function() onRefresh;

  const RefreshIndicator({
    super.key,
    this.edgeOffset = 0,
    required this.onRefresh,
    required this.child,
  });

  @override
  M.Widget build(M.BuildContext context) {
    return M.RefreshIndicator(
      displacement: 20,
      edgeOffset: edgeOffset,
      color: U.Theme.primary,
      backgroundColor: U.Theme.surface,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
