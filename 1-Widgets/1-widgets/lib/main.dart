import 'package:widgets/first_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: FirstWidget(),
      ),
    ),
  );
  // runApp(const MyApp());
}
