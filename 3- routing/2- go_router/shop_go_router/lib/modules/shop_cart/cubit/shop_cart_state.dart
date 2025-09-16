part of 'shop_cart_cubit.dart';

final class ShopCartState {
  //
  final bool loading;

  final List<ShopItem> shopItems;

  const ShopCartState({
    required this.loading,
    required this.shopItems,
  });

  const ShopCartState.init()
      : loading = false,
        shopItems = const [];

  int get totalAmount {
    return shopItems.fold(
      0,
      (preValue, shopItem) {
        return preValue + (shopItem.product.price * shopItem.count);
      },
    );
  }
//با بالایی برابره
  // int get totalAmount {
  //  var temp=0;
  //  for (var element in shopItems){
  //   temp+=( element.product.price * element.count);
  //  }
  //  return temp;
  // }

  ShopCartState copyWith({
    bool? loading,
    List<ShopItem>? shopItems,
  }) {
    return ShopCartState(
      loading: loading ?? this.loading,
      shopItems: shopItems ?? this.shopItems,
    );
  }
}
