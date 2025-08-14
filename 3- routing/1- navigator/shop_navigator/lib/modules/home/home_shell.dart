import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_navigator/modules/app/cubit/app_cubit.dart';
import 'package:shop_navigator/modules/categories/categories_page.dart';
import 'package:shop_navigator/modules/favorites/favorites_page.dart';
import 'package:shop_navigator/modules/home/cubit/home_cubit.dart';
import 'package:shop_navigator/modules/profile/profile_page.dart';
import 'package:shop_navigator/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_navigator/modules/store/store_page.dart';
import '/ui_kit/ui_kit.dart' as U;

class HomeShell extends StatelessWidget {
  //
  final bool hidNav;
  final StatefulNavigationShell child;
  const HomeShell({super.key, required this.child, required this.hidNav});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, appState) {
            final homeCubit = BlocProvider.of<HomeCubit>(context);
            homeCubit.onSelectedIndexChanged(child.currentIndex);
            return Scaffold(
              backgroundColor: U.Theme.background,
              drawer: Container(
                color: Colors.white,
                height: double.infinity,
                width: 200,
              ),
              // bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
              //   builder: (context, state) {
              //     return U.NavigationBar(
              //         selectedIndex: child.currentIndex,
              //         destinations: [
              //           U.NavigationDestination(
              //             title: 'دسته‌بندی',
              //             icon: U.Icons.category,
              //           ),
              //           U.NavigationDestination(
              //             title: 'سبدخرید',
              //             badgeCount: state.shopItemsCount,
              //             icon: U.Icons.shopCart,
              //           ),
              //           U.NavigationDestination(
              //             title: 'فروشگاه',
              //             icon: U.Icons.store,
              //           ),
              //           U.NavigationDestination(
              //             title: 'علاقه‌مندی‌ها',
              //             badgeCount: state.favsCount,
              //             icon: U.Icons.favorites,
              //           ),
              //           U.NavigationDestination(
              //             title: 'پروفایل',
              //             icon: U.Icons.profile,
              //           ),
              //         ],
              //         onDestinationChanged: child.goBranch
              //(int i) {
              // int temp1 = state.selectedIndex;

              // String get() {
              //   String temp = '';
              //   switch (i) {
              //     case 0:
              //       temp = CategoriesPage.route;

              //     case 3:
              //       temp = FavoritesPage.route;

              //     case 1:
              //       temp = ShopCartPage.route;

              //     case 2:
              //       temp = StorePage.route;
              //     case 4:
              //       temp = ProfilePage.route;
              //   }
              //   return temp;
              // }

              // GoRouter.of(context).goNamed(get());
              //   appCubit.onSelectedIndexChanged(i);
              // }
              // );
              // },
              // ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      U.AppBar.primary(
                        onMenuPressed: () {},
                        onNotifPressed: () {},
                      ),
                      Expanded(child: child
                          //  IndexedStack(
                          //   index: appState.selectedIndex,
                          //   children: [
                          //     CategoriesPage(),
                          //     ShopCartPage(),
                          //     StorePage(),
                          //     FavoritesPage(),
                          //     ProfilePage(),
                          //   ],
                          // ),
                          ),
                    ],
                  ),
                  AnimatedPositioned(
                      left: 0,
                      right: 0,
                      bottom: hidNav ? -111 : 0,
                      duration: Duration(seconds: 1),
                      child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                        return U.NavigationBar(
                            selectedIndex: child.currentIndex,
                            destinations: [
                              U.NavigationDestination(
                                title: 'دسته‌بندی',
                                icon: U.Icons.category,
                              ),
                              U.NavigationDestination(
                                title: 'سبدخرید',
                                badgeCount: state.shopItemsCount,
                                icon: U.Icons.shopCart,
                              ),
                              U.NavigationDestination(
                                title: 'فروشگاه',
                                icon: U.Icons.store,
                              ),
                              U.NavigationDestination(
                                title: 'علاقه‌مندی‌ها',
                                badgeCount: state.favsCount,
                                icon: U.Icons.favorites,
                              ),
                              U.NavigationDestination(
                                title: 'پروفایل',
                                icon: U.Icons.profile,
                              ),
                            ],
                            onDestinationChanged: child.goBranch);
                      }))
                ],
              ),
            );
            // ),
          },
        ));
  }
}
