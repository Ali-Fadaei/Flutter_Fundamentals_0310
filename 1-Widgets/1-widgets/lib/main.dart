import 'package:widgets/column_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.brown,
          child: ColumnLayout(),
        ),
      ),
    );
  }
}
