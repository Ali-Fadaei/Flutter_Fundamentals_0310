import 'dart:async';

import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class IconButton extends StatefulWidget {
  //
  final double size;

  final bool? loading;

  final bool disabled;

  final Color color;

  final Widget icon;

  final FutureOr<void> Function() onPressed;

  const IconButton({
    super.key,
    this.loading,
    this.disabled = false,
    this.color = Colors.transparent,
    this.size = 50,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
  //
  var autoLoading = true;

  var loading = false;

  @override
  void initState() {
    if (widget.loading != null) {
      autoLoading = false;
      loading = widget.loading!;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant IconButton oldWidget) {
    if (oldWidget.loading != widget.loading) {
      if (widget.loading != null) {
        setState(() {
          loading = widget.loading!;
        });
      } else {
        setState(() {
          autoLoading = true;
          loading = false;
        });
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPressed() async {
    try {
      if (autoLoading) {
        setState(() {
          loading = true;
        });
      }
      await widget.onPressed();
    } finally {
      if (autoLoading) {
        try {
          setState(() {
            loading = false;
          });
        } catch (e) {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.65 : 1.0,
      child: Center(
        child: SizedBox.square(
          dimension: widget.size,
          child: Material(
            color: widget.color,
            borderRadius: BorderRadius.circular(
              U.Theme.r15,
            ),
            child: InkWell(
              onTap: widget.disabled ? null : _onPressed,
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
                          color: U.Theme.primary,
                          strokeWidth: 1.2,
                        ),
                      )
                    : widget.icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
