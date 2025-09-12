import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class IconButton extends StatelessWidget {
  //
  final double size;

  final bool loading;

  final bool disabled;

  final Color color;

  final Widget icon;

  final void Function() onPressed;

  const IconButton({
    super.key,
    this.disabled = false,
    this.loading = false,
    this.color = Colors.transparent,
    this.size = 50,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.65 : 1.0,
      child: Center(
        child: SizedBox.square(
          dimension: size,
          child: Material(
            color: color,
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
                child: loading
                    ? SizedBox.square(
                        dimension: 24,
                        child: CircularProgressIndicator(
                          color: U.Theme.surface,
                          strokeWidth: 1.2,
                        ),
                      )
                    : icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
