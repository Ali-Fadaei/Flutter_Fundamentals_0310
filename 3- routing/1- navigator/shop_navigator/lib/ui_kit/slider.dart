import 'package:flutter/material.dart' as M;

class Slider extends M.StatelessWidget {
  void Function(double amount) onChanged;
  final double value;
  final M.Color color;
  final int? divisions;
  Slider(
      {super.key,
      this.divisions,
      required this.onChanged,
      required this.value,
      required this.color});

  @override
  M.Widget build(M.BuildContext context) {
    return M.Slider(
        divisions: divisions,
        activeColor: M.Colors.red,
        value: value,
        onChanged: onChanged);
  }
}
