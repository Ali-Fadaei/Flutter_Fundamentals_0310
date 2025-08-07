import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_go_router/modules/app/transitions.dart';
import 'package:shop_go_router/modules/home/home_page.dart';
import 'package:shop_go_router/modules/page_a/page_a.dart';
import 'package:shop_go_router/modules/page_b/page_b.dart';
import 'package:shop_go_router/modules/page_c/page_c.dart';
import 'package:shop_go_router/modules/page_d/page_d.dart';
import 'package:shop_go_router/modules/page_f/page_f.dart';

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    print('state.fullPath');
    print(state.fullPath);
    print('state.uri.scheme');
    print(state.uri.scheme);
    print('state.uri.host');
    print(state.uri.host);
    print('state.uri.port');
    print(state.uri.port);
    print('state.uri.path');
    print(state.uri.path);

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (context, state) {
        return HomePage();
      },
    ),
    GoRoute(
      path: PageA.route,
      name: PageA.route,
      pageBuilder: (context, state) {
        return GoSlideUpTransition(
          key: state.pageKey,
          child: PageA(content: ''),
        );
      },
      // builder: (context, state) {
      //   return PageA(content: 'static content');
      // },
      routes: [
        GoRoute(
          path: PageB.route,
          name: PageB.route,
          pageBuilder: (context, state) {
            return GoSlideUpTransition(
              key: state.pageKey,
              child: PageB(content: ''),
            );
          },
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) {
        return PageC(
          content: 'static content',
          childPage: child,
        );
      },
      routes: [
        GoRoute(
          path: PageD.route,
          name: PageD.route,
          builder: (context, state) {
            return PageD(content: 'static content');
          },
        ),
        GoRoute(
          path: PageF.route,
          name: PageF.route,
          builder: (context, state) {
            return PageF(content: 'static content');
          },
        ),
      ],
    ),
  ],
);
