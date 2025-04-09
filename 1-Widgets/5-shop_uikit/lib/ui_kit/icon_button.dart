import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class IconButton extends StatelessWidget {
  //
  final double size;

  final bool disabled;

  final U.ButtonColor color;

  final Widget icon;

  final void Function() onPressed;

  const IconButton({
    super.key,
    this.disabled = false,
    this.color = U.ButtonColor.primary,
    this.size = 50,
    required this.icon,
    required this.onPressed,
  });

  ({Color background, Color foreground}) get _color {
    switch (color) {
      case U.ButtonColor.primary:
        return (
          background: U.Theme.primary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          ),
          foreground: U.Theme.onPrimary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          )
        );
      case U.ButtonColor.secondary:
        return (
          background: U.Theme.secondary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          ),
          foreground: U.Theme.onSecondary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          )
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: Material(
          color: _color.background,
          borderRadius: BorderRadius.circular(
            U.Theme.r15,
          ),
          child: InkWell(
            onTap: disabled ? null : onPressed,
            borderRadius: BorderRadius.circular(
              U.Theme.r15,
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsetsDirectional.all(8),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
