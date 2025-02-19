import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/models/shop_item.dart';
import 'package:shop_m3/pages/shop_cart/shop_cart_card.dart';

class ShopCartPage extends StatelessWidget {
  //
  final List<ShopItem> shopItems;

  final void Function(Product data) onAddPressed;

  final void Function(Product data) onRemovePressed;

  const ShopCartPage({
    super.key,
    required this.shopItems,
    required this.onAddPressed,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: shopItems.length,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        return ShopCartCard(
          shopItem: shopItems[index],
          onAddPressed: onAddPressed,
          onRemovePressed: onRemovePressed,
        );
      },
    );
  }
}
