import 'package:flutter/material.dart';
import '../../domains/store/models/shop_item.dart';
import '../../domains/store/models/product.dart';
import '/modules/store/product_btms.dart';
import '/ui_kit/ui_kit.dart' as U;

class FavoritesCard extends StatelessWidget {
  //
  final Product product;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  final void Function(Product data) onRemoveFromCartPressed;

  const FavoritesCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritesPressed,
    required this.onAddtoCartPressed,
    required this.onRemoveFromCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProductBottomSheet.show(
          context,
          product: product,
          favorites: favorites,
          shopItems: shopItems,
          onFavoritesPressed: onFavoritesPressed,
          onAddtoCartPressed: onAddtoCartPressed,
          onRemoveFromCartPressed: onRemoveFromCartPressed,
        );
      },
      child: U.Card(
        height: 140,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: Image.asset(product.image, fit: BoxFit.contain),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  U.Text(
                    product.title,
                    size: U.TextSize.s14,
                    weight: U.TextWeight.bold,
                  ),
                  U.Text(
                    product.categoryData.title,
                    size: U.TextSize.s12,
                    weight: U.TextWeight.regular,
                  ),
                  U.Text(
                    '${product.price} تومان',
                    size: U.TextSize.s12,
                    weight: U.TextWeight.regular,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(width: 5),
            U.IconButton(
              icon: const Icon(Icons.favorite, color: U.Theme.primary),
              onPressed: () => onFavoritesPressed(product),
            ),
          ],
        ),
      ),
    );
  }
}
