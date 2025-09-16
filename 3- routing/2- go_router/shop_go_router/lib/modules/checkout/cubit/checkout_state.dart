part of 'checkout_cubit.dart';

class CheckoutState {
  //
  final bool loading;

  final bool discountLoading;

  final bool paymentLoading;

  final List<ShopItem> shopItems;

  final int discountPercent;

  const CheckoutState({
    required this.loading,
    required this.discountLoading,
    required this.paymentLoading,
    required this.shopItems,
    required this.discountPercent,
  });

  const CheckoutState.init({
    required this.shopItems,//؟؟؟؟؟؟؟؟؟؟؟
  })  : loading = false,
        discountLoading = false,
        paymentLoading = false,
        discountPercent = 0;

  int get totalAmount {
    return shopItems.fold(
      0,
      (preValue, shopItem) {
        return preValue + (shopItem.product.price * shopItem.count);
      },
    );
  }

  int get discountAmount {
    return totalAmount * discountPercent ~/ 100;
  }

  int get payableAmount {
    return totalAmount - discountAmount;
  }

  CheckoutState copyWith({
    bool? loading,
    bool? discountLoading,
    bool? paymentLoading,
    List<ShopItem>? shopItems,
    int? discountPercent,
  }) {
    return CheckoutState(
      loading: loading ?? this.loading,
      discountLoading: discountLoading ?? this.discountLoading,
      paymentLoading: paymentLoading ?? this.paymentLoading,
      shopItems: shopItems ?? this.shopItems,
      discountPercent: discountPercent ?? this.discountPercent,
    );
  }
}
