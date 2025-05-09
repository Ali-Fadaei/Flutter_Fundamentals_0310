import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '../../domains/store/models/shop_item.dart';
import '/modules/shop_cart/shop_cart_card.dart';
import '../../domains/store/models/product.dart';

class ShopCartPage extends StatelessWidget {
  //
  // final List<Product> favorites;

  // final List<ShopItem> shopItems;

  // final void Function(Product data) onFavoritesPressed;

  // final void Function(Product data) onAddtoCartPressed;

  // final void Function(Product data) onRemoveFromCartPressed;

  const ShopCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCartCubit, ShopCartState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.shopItems.length,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemBuilder: (context, index) {
            return ShopCartCard(
              shopItem: state.shopItems[index],
              // favorites: favorites,
              // shopItems: shopItems,
              // onFavoritesPressed: onFavoritesPressed,
              // onAddPressed: onAddtoCartPressed,
              // onRemovePressed: onRemoveFromCartPressed,
            );
          },
        );
      },
    );
  }
}
