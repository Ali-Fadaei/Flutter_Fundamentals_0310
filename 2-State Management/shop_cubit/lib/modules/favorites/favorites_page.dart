import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/favorites/cubit/favorites_cubit.dart';
import '../../domains/store/models/shop_item.dart';
import '../../domains/store/models/product.dart';
import 'favorites_card.dart';

class FavoritesPage extends StatelessWidget {
  //
  // final List<Product> favorites;

  // final List<ShopItem> shopItems;

  // final void Function(Product data) onFavoritesPressed;

  // final void Function(Product data) onAddtoCartPressed;

  // final void Function(Product data) onRemoveFromCartPressed;

  const FavoritesPage({
    super.key,
    // required this.favorites,
    // required this.shopItems,
    // required this.onFavoritesPressed,
    // required this.onAddtoCartPressed,
    // required this.onRemoveFromCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.favorites.length,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              final data = state.favorites[index];
              return FavoritesCard(
                product: data,
                // favorites: favorites,
                // shopItems: shopItems,
                // onAddtoCartPressed: onAddtoCartPressed,
                // onRemoveFromCartPressed: onRemoveFromCartPressed,
                // onFavoritesPressed: (_) {
                //   onFavoritesPressed(data);
                // },
              );
            },
          );
        },
      ),
    );
  }
}
