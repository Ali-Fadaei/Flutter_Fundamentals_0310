import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_auth/domains/user/user_repository.dart';
import 'package:shop_app_auth/modules/auth/auth_shell.dart';
import 'package:shop_app_auth/modules/auth/otp_confirm_page.dart';
import 'package:shop_app_auth/modules/auth/otp_page.dart';
import 'package:shop_app_auth/modules/auth/otp_register_page.dart';

import '/modules/app/transitions.dart';
import '/modules/categories/categories_page.dart';
import '/modules/category/category_page.dart';
import '/modules/checkout/checkout_page.dart';
import '/modules/favorites/favorites_page.dart';
import '/modules/home/home_shell.dart';
import '/modules/profile/profile_page.dart';
import '/modules/search/search_page.dart';
import '/modules/shop_cart/shop_cart_page.dart';
import '/modules/store/store_page.dart';

final rootNavKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: StorePage.route,
  navigatorKey: rootNavKey,
  redirect: (context, state) {
    final fullPath = state.uri.toString();
    print('fullPath');
    print(fullPath);
    final userRepo = context.read<UserRepository>();
    final isAuth = userRepo.checkJwtAuth();
    print('isAuth');
    print(isAuth);
    if (isAuth) {
      return (fullPath.contains('auth') || fullPath == '/')
          ? StorePage.route
          : null;
    } else {
      return (!fullPath.contains('auth') || fullPath == '/')
          ? OtpPage.route
          : null;
    }
  },
  //auth/otp
  //auth/otp/confirm
  //auth/otp/confirm/register
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AuthShell(
          route: state.fullPath.toString(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: OtpPage.route,
          name: OtpPage.route,
          builder: (context, state) {
            return OtpPage();
          },
          routes: [
            GoRoute(
              path: OtpConfirmPage.route,
              name: OtpConfirmPage.route,
              redirect: (context, state) {
                return state.extra == null ? OtpPage.route : null;
              },
              builder: (context, state) => OtpConfirmPage(),
            ),
            GoRoute(
              path: OtpRegisterPage.route,
              name: OtpRegisterPage.route,
              redirect: (context, state) {
                return state.extra == null ? OtpPage.route : null;
              },
              builder: (context, state) => OtpRegisterPage(),
            ),
          ],
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeShell(
          hideNavBar: [
            CategoryPage.route,
            SearchPage.route,
            CheckoutPage.route,
          ].contains(state.topRoute?.name ?? ''),
          child: navigationShell,
        );
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
              routes: [
                GoRoute(
                  path: CategoryPage.route,
                  name: CategoryPage.route,
                  pageBuilder: (context, state) {
                    return GoNoTransition(
                      key: state.pageKey,
                      child: CategoryPage(
                        data: state.extra as dynamic,
                        categoryId: int.parse(
                          state.pathParameters['id']!,
                        ),
                      ),
                    );
                  },
                  // builder: (context, state) {
                  //   return CategoryPage(
                  //     categoryId: int.parse(
                  //       state.pathParameters['id']!,
                  //     ),
                  //   );
                  // },
                ),
              ],
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
              routes: [
                GoRoute(
                  path: CheckoutPage.route,
                  name: CheckoutPage.route,
                  builder: (context, state) {
                    return CheckoutPage(
                      shopItmes: state.extra as dynamic,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StorePage.route,
              name: StorePage.route,
              builder: (context, state) {
                print('state.uri.queryParameters[pid]');
                print(state.uri.queryParameters['pid']);
                return StorePage(
                  initialProductId: int.tryParse(
                    state.uri.queryParameters['pid'] ?? '',
                  ),
                );
              },
              routes: [
                GoRoute(
                  name: SearchPage.route,
                  path: SearchPage.route,
                  pageBuilder: (context, state) {
                    return GoSharedAxisTransition(
                      key: state.pageKey,
                      type: SharedAxisTransitionType.vertical,
                      child: SearchPage(
                        searchTitle: state.pathParameters['title'] as String,
                      ),
                    );
                  },
                  // builder: (context, state) {
                  //   return SearchPage(
                  //     searchTitle: state.pathParameters['title'] as String,
                  //   );
                  // },
                ),
              ],
            ),
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
  ],
);
