part of 'shop_cart_cubit.dart';

enum ShopCartContentStatus {
  empty,
  fill,
  error,
}

final class ShopCartState {
  //
  final bool loading;

  final ShopCartContentStatus contentStatus;

  final List<ShopItem> shopItems;

  const ShopCartState({
    required this.loading,
    required this.contentStatus,
    required this.shopItems,
  });

  const ShopCartState.init()
      : loading = false,
        contentStatus = ShopCartContentStatus.empty,
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
    ShopCartContentStatus? contentStatus,
    List<ShopItem>? shopItems,
  }) {
    return ShopCartState(
      loading: loading ?? this.loading,
      contentStatus: contentStatus ?? this.contentStatus,
      shopItems: shopItems ?? this.shopItems,
    );
  }
}
