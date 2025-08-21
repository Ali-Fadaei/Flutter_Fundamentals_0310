part of 'checkout_cubit.dart';

class CheckoutState {
  //
  final bool loading;

  final bool discountLoading;

  final bool paymentLoading;

  final List<ShopItem> shopItems;

  final int totalAmount;

  final int discountPercent;

  final int discountAmount;

  final int payableAmount;

  const CheckoutState({
    required this.loading,
    required this.discountLoading,
    required this.paymentLoading,
    required this.shopItems,
    required this.totalAmount,
    required this.discountPercent,
    required this.discountAmount,
    required this.payableAmount,
  });

  const CheckoutState.init()
      : loading = false,
        discountLoading = false,
        paymentLoading = false,
        shopItems = const [],
        totalAmount = 0,
        discountPercent = 0,
        discountAmount = 0,
        payableAmount = 0;

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
      totalAmount: totalAmount,
      discountAmount: discountAmount,
      payableAmount: payableAmount,
      // payableAmount: totalAmount - discountAmount,
    );
  }
}
