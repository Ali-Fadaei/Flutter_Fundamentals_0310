import 'package:flutter/material.dart';
import '/domains/business/models/shop_item.dart';
import '/domains/business/models/product.dart';
import '/modules/store/product_btms.dart';
import '/ui_kit/ui_kit.dart' as U;

class ShopCartCard extends StatelessWidget {
  //

  final ShopItem shopItem;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddPressed;

  final void Function(Product data) onRemovePressed;

  const ShopCartCard({
    super.key,
    required this.shopItem,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritesPressed,
    required this.onAddPressed,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProductBottomSheet.show(
          context,
          product: shopItem.product,
          favorites: favorites,
          shopItems: shopItems,
          onFavoritesPressed: onFavoritesPressed,
          onAddtoCartPressed: onAddPressed,
          onRemoveFromCartPressed: onRemovePressed,
        );
      },
      child: U.Card(
        height: 140,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: Image.asset(shopItem.product.image, fit: BoxFit.cover),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  U.Text(
                    shopItem.product.title,
                    size: U.TextSize.s16,
                    weight: U.TextWeight.bold,
                  ),
                  U.Text(
                    shopItem.product.categoryData.title,
                    size: U.TextSize.s12,
                    weight: U.TextWeight.regular,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                U.Counter(
                  count: shopItem.count,
                  onIncresePressed: () => onAddPressed(shopItem.product),
                  onDecresePressed: () => onRemovePressed(shopItem.product),
                ),
                const SizedBox(height: 6),

                U.Text(
                  '${(shopItem.count * shopItem.product.price)} تومان',
                  size: U.TextSize.s14,
                  weight: U.TextWeight.medium,
                ),
                // const SizedBox(height: 8),
                // Row(
                //   children: [
                //     IconButton.filledTonal(
                //       onPressed: () => onRemovePressed(shopItem.product),
                //       icon: Icon(Icons.remove),
                //     ),
                //     const SizedBox(width: 4),
                //     SizedBox(
                //       width: 40,
                //       child: Text(
                //         shopItem.count.toString(),
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 4),
                //     IconButton.filledTonal(
                //       onPressed: () => onAddPressed(shopItem.product),
                //       icon: Icon(Icons.add),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
