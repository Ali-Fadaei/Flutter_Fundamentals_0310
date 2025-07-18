import 'package:flutter/material.dart';
import '/ui_kit/ui_kit.dart' as U;

class PageC extends StatelessWidget {
  //
  final String content;

  const PageC({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        U.Text('Page C'),
        const SizedBox(
          height: 30,
        ),
        U.Text(content),
        const SizedBox(
          height: 30,
        ),
        U.Button(
          title: 'Go Back',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
