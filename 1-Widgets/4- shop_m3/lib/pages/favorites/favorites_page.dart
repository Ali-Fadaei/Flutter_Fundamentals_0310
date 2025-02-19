import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/pages/favorites/favorites_card.dart';

class FavoritesPage extends StatelessWidget {
  //
  final List<Product> favorites;

  final void Function(Product data) onFavoritesPressed;

  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.onFavoritesPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: favorites.length,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        final data = favorites[index];
        return FavoritesCard(
          product: data,
          onFavoritePressed: (_) {
            onFavoritesPressed(data);
          },
        );
      },
    );
  }
}
