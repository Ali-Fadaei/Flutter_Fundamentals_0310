import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/app/cubit/app_cubit.dart';
import 'package:shop_cubit/modules/favorites/cubit/favorites_cubit.dart';
import 'package:shop_cubit/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_cubit/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_cubit/modules/store/cubit/store_cubit.dart';
import '../profile/profile_page.dart';
import '../../domains/store/models/product.dart';
import '../category/category_page.dart';
import '../favorites/favorites_page.dart';
import '../store/store_page.dart';
import '../../domains/store/models/category.dart';
import '/ui_kit/ui_kit.dart' as U;

class AppPage extends StatelessWidget {
  //
  const AppPage({super.key});

  //
  @override
  Widget build(BuildContext context) {
    final appCubit = BlocProvider.of<AppCubit>(context);
    return BlocBuilder<AppCubit, AppState>(
      // buildWhen:
      //     (previous, current) =>
      //         previous.selectedIndex != current.selectedIndex,
      builder: (context, appState) {
        return Scaffold(
          backgroundColor: U.Theme.background,
          drawer: Container(
            color: Colors.white,
            height: double.infinity,
            width: 200,
          ),
          bottomNavigationBar: U.NavigationBar(
            selectedIndex: appState.selectedIndex,
            destinations: [
              U.NavigationDestination(
                title: 'دسته‌بندی',
                icon: U.Icons.category,
              ),
              U.NavigationDestination(
                title: 'سبدخرید',
                badgeCount: 0,
                // badgeCount: state.shopItems.length,
                icon: U.Icons.shopCart,
              ),
              U.NavigationDestination(title: 'فروشگاه', icon: U.Icons.store),
              U.NavigationDestination(
                title: 'علاقه‌مندی‌ها',
                badgeCount: 0,
                // badgeCount: state.favorites.length,
                icon: U.Icons.favorites,
              ),
              U.NavigationDestination(title: 'پروفایل', icon: U.Icons.profile),
            ],
            onDestinationChanged: appCubit.onSelectedIndexChanged,
          ),
          body: Column(
            children: [
              U.AppBar.primary(onMenuPressed: () {}, onNotifPressed: () {}),
              Expanded(
                child: IndexedStack(
                  index: appState.selectedIndex,
                  children: [
                    CategoryPage(),
                    ShopCartPage(
                      // favorites: favState.favorites,
                      // shopItems: shopCartState.shopItems,
                      // onFavoritesPressed:
                      //     favCubit.onFavoriteButtonTapped,
                      // onAddtoCartPressed:
                      //     shopCartCubit.onAddToShopCartPressed,
                      // onRemoveFromCartPressed:
                      //     shopCartCubit.onRemoveFromShopCartPressed,
                    ),
                    StorePage(
                      // favorites: favState.favorites,
                      // shopItems: shopCartState.shopItems,
                      // onFavoritesPressed:
                      //     favCubit.onFavoriteButtonTapped,
                      // onAddtoCartPressed:
                      //     shopCartCubit.onAddToShopCartPressed,
                      // onRemoveFromCartPressed:
                      //     shopCartCubit.onRemoveFromShopCartPressed,
                    ),
                    FavoritesPage(
                      // favorites: favState.favorites,
                      // shopItems: shopCartState.shopItems,
                      // onFavoritesPressed:
                      //     favCubit.onFavoriteButtonTapped,
                      // onAddtoCartPressed:
                      //     shopCartCubit.onAddToShopCartPressed,
                      // onRemoveFromCartPressed:
                      //     shopCartCubit.onRemoveFromShopCartPressed,
                    ),
                    ProfilePage(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
