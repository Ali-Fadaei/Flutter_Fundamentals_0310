import 'package:go_router/go_router.dart';
import 'package:shop_go_router/modules/home/home_page.dart';
import 'package:shop_go_router/modules/page_a/page_a.dart';
import 'package:shop_go_router/modules/page_b/page_b.dart';
import 'package:shop_go_router/modules/page_c/page_c.dart';

final router = GoRouter(
  initialLocation: '/',
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
      builder: (context, state) {
        return PageA(content: 'static content');
      },
      routes: [
        GoRoute(
          path: PageB.route,
          name: PageB.route,
          builder: (context, state) {
            return PageB(content: 'static content');
          },
        ),
      ],
    ),
    GoRoute(
      path: PageC.route,
      name: PageC.route,
      builder: (context, state) {
        return PageC(
          content: 'static content',
        );
      },
      routes: [
        GoRoute(
          path: PageB.route,
          name: '${PageB.route}2',
          builder: (context, state) {
            return PageB(content: 'static content');
          },
        ),
      ],
    ),
  ],
);
