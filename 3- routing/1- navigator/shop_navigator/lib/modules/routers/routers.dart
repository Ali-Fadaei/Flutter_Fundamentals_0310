import 'package:go_router/go_router.dart';
import 'package:shop_navigator/domains/store/models/category.dart';
import 'package:shop_navigator/modules/categories/categories_page.dart';
import 'package:shop_navigator/modules/category/category_page.dart';
import 'package:shop_navigator/modules/favorites/favorites_page.dart';
import 'package:shop_navigator/modules/home/home_page.dart';
import 'package:shop_navigator/modules/page_a/page_a.dart';
import 'package:shop_navigator/modules/page_b/page_b.dart';
import 'package:shop_navigator/modules/page_c/page_c.dart';
import 'package:shop_navigator/modules/page_d/page_d.dart';
import 'package:shop_navigator/modules/page_f/page_f.dart';
import 'package:shop_navigator/modules/profile/profile_page.dart';
import 'package:shop_navigator/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_navigator/modules/store/store_page.dart';

final routes = GoRouter(initialLocation: StorePage.route, routes: [
  // GoRoute(
  //   path: StorePage.route,
  //   name: StorePage.route,
  //   builder: (context, state) => StorePage(),
  // ),
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
      ]),

  ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(
          path: ProfilePage.route,
          name: ProfilePage.route,
          builder: (context, state) => ProfilePage(),
        ),
        GoRoute(
          path: StorePage.route,
          name: StorePage.route,
          builder: (context, state) => StorePage(),
        ),
        GoRoute(
          path: FavoritesPage.route,
          name: FavoritesPage.route,
          builder: (context, state) => FavoritesPage(),
        ),
        GoRoute(
          path: ShopCartPage.route,
          name: ShopCartPage.route,
          builder: (context, state) => ShopCartPage(),
        ),
        GoRoute(
          // routes: [
          //   GoRoute(
          //     path: CategoryPage.path,
          //     name: CategoryPage.path,
          //     builder: (context, state) => CategoryPage(
          //       category: state.extra as CategoryData,
          //     ),
          //   ),
          // ],
          path: CategoriesPage.route,
          name: CategoriesPage.route,
          builder: (context, state) => CategoriesPage(),
        )
      ]),
  GoRoute(
    path: CategoryPage.path,
    name: CategoryPage.path,
    builder: (context, state) => CategoryPage(
      category: state.extra as CategoryData,
    ),
  ),
]);
