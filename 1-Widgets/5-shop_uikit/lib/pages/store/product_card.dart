import 'package:flutter/material.dart';
import '/models/product.dart';
import '/models/shop_item.dart';
import '/pages/store/product_btms.dart';
import '/ui_kit/ui_kit.dart' as U;

class ProductCard extends StatelessWidget {
  //
  final Product data;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  final void Function(Product data) onRemoveFromCartPressed;

  const ProductCard({
    super.key,
    required this.data,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritesPressed,
    required this.onAddtoCartPressed,
    required this.onRemoveFromCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        ProductBottomSheet.show(
          context,
          product: data,
          favorites: favorites,
          shopItems: shopItems,
          onFavoritesPressed: onFavoritesPressed,
          onAddtoCartPressed: onAddtoCartPressed,
          onRemoveFromCartPressed: onRemoveFromCartPressed,
        );
      },
      child: SizedBox(
        height: 320,
        width: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                U.Image(path: data.image),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.title,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    U.Text(
                      'امتیاز: ${data.rating}',
                      size: U.TextSize.s12,
                      color: U.Theme.outline2,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: () => onAddtoCartPressed(data),
                      icon: Icon(Icons.add),
                    ),
                    const Spacer(),
                    U.Text(
                      'تومان${data.price}',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
