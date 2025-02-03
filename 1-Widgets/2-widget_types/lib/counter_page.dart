import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  //
  var count = 0;

  void onFACPressed() {
    print('Floating Action Button Pressed');
    print(count);
    setState(() {
      count = count + 1;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onFACPressed,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text('Current Count is: $count'),
      ),
    );
  }
}
