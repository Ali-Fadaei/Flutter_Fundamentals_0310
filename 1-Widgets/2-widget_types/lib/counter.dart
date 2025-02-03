import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  //
  final int count;

  const Counter({
    super.key,
    required this.count,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  //

  @override
  void initState() {
    print('Counter init state fired!');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Counter oldWidget) {
    print('Counter didUpdateWidget fired!');

    print('oldWidget.count');
    print(oldWidget.count);

    print('widget.count');
    print(widget.count);

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('Counter Build Method Fired!');
    return Center(
      child: Text(
        'Current Count is: ${widget.count}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
