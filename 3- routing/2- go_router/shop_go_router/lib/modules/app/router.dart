import 'package:go_router/go_router.dart';
import 'package:shop_go_router/modules/app/transitions.dart';
import 'package:shop_go_router/modules/categories/categories_page.dart';
import 'package:shop_go_router/modules/favorites/favorites_page.dart';
import 'package:shop_go_router/modules/home/home_shell.dart';
import 'package:shop_go_router/modules/page_a/page_a.dart';
import 'package:shop_go_router/modules/page_b/page_b.dart';
import 'package:shop_go_router/modules/page_c/page_c.dart';
import 'package:shop_go_router/modules/page_d/page_d.dart';
import 'package:shop_go_router/modules/page_f/page_f.dart';
import 'package:shop_go_router/modules/profile/profile_page.dart';
import 'package:shop_go_router/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_go_router/modules/store/store_page.dart';

final router = GoRouter(
  initialLocation: StorePage.route,
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
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeShell(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: CategoriesPage.route,
              name: CategoriesPage.route,
              builder: (context, state) {
                return CategoriesPage();
              },
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ShopCartPage.route,
              name: ShopCartPage.route,
              builder: (context, state) {
                return ShopCartPage();
              },
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StorePage.route,
              name: StorePage.route,
              builder: (context, state) {
                return StorePage();
              },
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: FavoritesPage.route,
              name: FavoritesPage.route,
              builder: (context, state) {
                return FavoritesPage();
              },
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProfilePage.route,
              name: ProfilePage.route,
              builder: (context, state) {
                return ProfilePage();
              },
            )
          ],
        ),
      ],
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
