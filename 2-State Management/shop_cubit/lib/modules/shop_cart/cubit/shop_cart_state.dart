part of 'shop_cart_cubit.dart';

final class ShopCartState {
  //
  final List<ShopItem> shopItems;

  const ShopCartState({required this.shopItems});

  const ShopCartState.init() : shopItems = const [];

  ShopCartState copyWith({List<ShopItem>? shopItems}) {
    return ShopCartState(shopItems: shopItems ?? this.shopItems);
  }
}
