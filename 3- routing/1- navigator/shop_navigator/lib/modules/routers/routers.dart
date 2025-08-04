import 'package:go_router/go_router.dart';
import 'package:shop_navigator/modules/home/home_page.dart';
import 'package:shop_navigator/modules/page_a/page_a.dart';
import 'package:shop_navigator/modules/page_b/page_b.dart';
import 'package:shop_navigator/modules/page_c/page_c.dart';
import 'package:shop_navigator/modules/page_d/page_d.dart';
import 'package:shop_navigator/modules/page_f/page_f.dart';

final routes = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: '/',
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
      redirect: (context, state) {
        print('state.pathA');
        print(state.path);
        print('state.pathParametersA');
        print(state.pathParameters);
      },
      path: PageA.route,
      name: PageA.route,
      builder: (context, state) => PageA(content: 'contentA'),
      routes: [
        GoRoute(
          redirect: (context, state) {
            print('state.pathB');
            print(state.path);
            print('state.pathParametersB');
            print(state.pathParameters);
          },
          path: PageB.route,
          name: PageB.route,
          builder: (context, state) => PageB(content: 'contentA'),
        )
      ]),
  ShellRoute(
      builder: (context, state, child) => PageC(
            content: 'content',
            childPage: child,
          ),
      routes: [
        GoRoute(
          path: PageD.route,
          name: PageD.route,
          builder: (context, state) => PageD(content: 'contentA'),
        ),
        GoRoute(
          path: PageF.route,
          name: PageF.route,
          builder: (context, state) => PageF(content: 'contentA'),
        )
      ])
]);
