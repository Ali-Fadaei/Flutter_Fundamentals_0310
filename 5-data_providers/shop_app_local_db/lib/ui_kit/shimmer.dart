import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as S;
import '/ui_kit/ui_kit.dart' as U;

class Shimmer extends StatelessWidget {
  //
  final bool enable;

  final bool contain;

  final AlignmentGeometry align;

  final double? containWidth;

  final double? containHeight;

  final double containRadius;

  final Color? baseColor;

  final Color? highlightColor;

  final Widget? child;

  const Shimmer({
    super.key,
    this.enable = false,
    this.baseColor,
    this.highlightColor,
    this.child,
  })  : contain = false,
        containWidth = null,
        containHeight = null,
        align = AlignmentDirectional.center,
        containRadius = 0.0;

  const Shimmer.contain({
    super.key,
    this.enable = false,
    this.containWidth,
    this.containHeight,
    this.align = AlignmentDirectional.center,
    this.containRadius = U.Theme.r15,
    this.baseColor,
    this.highlightColor,
    this.child,
  }) : contain = true;

  const Shimmer.text({
    super.key,
    this.enable = false,
    this.containWidth = 40,
    this.containHeight = 12,
    this.align = AlignmentDirectional.centerStart,
    this.containRadius = U.Theme.r15,
    this.baseColor,
    this.highlightColor,
    this.child,
  }) : contain = true;

  @override
  Widget build(BuildContext context) {
    return enable
        ? S.Shimmer.fromColors(
            baseColor: baseColor ?? U.Theme.outline,
            highlightColor: highlightColor ?? U.Theme.outline2,
            child: contain
                ? Align(
                    alignment: align,
                    child: Container(
                      width: containWidth,
                      height: containHeight,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(containRadius),
                      ),
                    ),
                  )
                : AbsorbPointer(absorbing: true, child: child),
          )
        : child ?? SizedBox();
  }
}
