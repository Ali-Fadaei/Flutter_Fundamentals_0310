import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_navigator/modules/page_c/page_c.dart';
import 'package:shop_navigator/modules/page_d/page_d.dart';
import 'package:shop_navigator/modules/page_f/page_f.dart';
import '/ui_kit/ui_kit.dart' as U;

class PageB extends StatelessWidget {
  //
  // static const route = '/PageB/:id';
  static const route = '/PageB/:id2';

  final String content;

  const PageB({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          U.Text('Page B'),
          const SizedBox(
            height: 30,
          ),
          U.Text(content),
          const SizedBox(
            height: 30,
          ),
          U.Button(
            title: 'Go Page D',
            onPressed: () {
              GoRouter.of(context).go(
                // pathParameters: {'id': '233243'},
                PageD.route,
              );
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => PageC(
              //       content: 'Page C Content',
              //     ),
              //   ),
              // );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          U.Button(
            title: 'Go Back',
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
