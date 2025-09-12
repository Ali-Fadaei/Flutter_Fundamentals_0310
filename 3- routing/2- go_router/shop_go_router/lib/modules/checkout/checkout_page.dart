import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_go_router/domains/store/models/shop_item.dart';
import 'package:shop_go_router/domains/store/store_repository.dart';
import 'package:shop_go_router/modules/checkout/cubit/checkout_cubit.dart';
import '/ui_kit/ui_kit.dart' as U;

class CheckoutPage extends StatelessWidget {
//
  static const route = '/checkout';

  final List<ShopItem>? shopItmes;

  const CheckoutPage({
    super.key,
    this.shopItmes,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(
        initialShopItems: shopItmes,
        storeRepo: context.read<StoreRepository>(),
      ),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: U.Theme.background,
            body: BlocBuilder<CheckoutCubit, CheckoutState>(
              builder: (context, state) {
                final checkoutCubit = context.read<CheckoutCubit>();
                return state.loading
                    ? Center(
                        child: const CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          U.AppBar.secondary(
                            title: 'تکمیل خرید',
                            onBackPressed: () => GoRouter.of(context).pop(),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(12.0),
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 1000),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 60,
                                      child: U.Card(
                                        padding: const EdgeInsets.all(18),
                                        child: Column(
                                          children: [
                                            const Row(
                                              children: [
                                                U.Image(
                                                  height: 24,
                                                  width: 24,
                                                  //todo:
                                                  path: U.Icons.orderIcon,
                                                  color: U.Theme.primary,
                                                ),
                                                SizedBox(width: 5),
                                                U.Text(
                                                  'سبدخرید',
                                                  size: U.TextSize.s16,
                                                  weight: U.TextWeight.medium,
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            const U.Divider.horizontal(
                                              space: 0,
                                              color: U.Theme.secondary,
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: ListView(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                ),
                                                children: [
                                                  ...state.shopItems.expand(
                                                    (element) => [
                                                      _CheckoutItem(
                                                        shopItem: element,
                                                      ),
                                                      if (state
                                                              .shopItems.last !=
                                                          element)
                                                        const U
                                                            .Divider.horizontal(),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const U.Divider.horizontal(
                                              space: 0,
                                              color: U.Theme.secondary,
                                            ),
                                            const SizedBox(height: 12),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                              ),
                                              child: Wrap(
                                                spacing: 20,
                                                runSpacing: 20,
                                                alignment: WrapAlignment.center,
                                                runAlignment:
                                                    WrapAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const U.Text(
                                                        'جمع سبد: ',
                                                        size: U.TextSize.s14,
                                                        color: U.Theme.primary,
                                                      ),
                                                      U.Text(
                                                        state.totalAmount
                                                            .toString(),
                                                        size: U.TextSize.s14,
                                                        weight:
                                                            U.TextWeight.medium,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const U.Text(
                                                        'جمع تخفیفات: ',
                                                        size: U.TextSize.s14,
                                                        color: U.Theme.primary,
                                                      ),
                                                      U.Text(
                                                        state.discountAmount
                                                            .toString(),
                                                        size: U.TextSize.s14,
                                                        weight:
                                                            U.TextWeight.medium,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const U.Text(
                                                        'قابل پرداخت: ',
                                                        size: U.TextSize.s14,
                                                        color: U.Theme.primary,
                                                      ),
                                                      U.Text(
                                                        state.payableAmount
                                                            .toString(),
                                                        size: U.TextSize.s14,
                                                        weight:
                                                            U.TextWeight.medium,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    U.Card(
                                      padding: const EdgeInsets.all(18),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              U.Image(
                                                height: 24,
                                                width: 24,
                                                path: U.Icons.paymentIcon,
                                                color: U.Theme.primary,
                                              ),
                                              SizedBox(width: 5),
                                              U.Text(
                                                'اطلاعات ارسال و پرداخت',
                                                size: U.TextSize.s16,
                                                weight: U.TextWeight.medium,
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          const U.Divider.horizontal(
                                            color: U.Theme.secondary,
                                          ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Column(
                                              children: [
                                                U.TextInput(
                                                  title: 'آدرس تحویل',
                                                  hint: 'استان، شهر، منطقه...',
                                                  isRequired: true,
                                                  controller:
                                                      checkoutCubit.addressCtrl,
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: U.TextInput(
                                                        title: 'کد تخفیف',
                                                        hint: 'ABCXyz10%',
                                                        controller:
                                                            checkoutCubit
                                                                .discountCtrl,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    U.IconButton(
                                                      icon: U.Image(
                                                        path: U
                                                            .Icons.discountIcon,
                                                        color:
                                                            U.Theme.onSecondary,
                                                      ),
                                                      color: U.Theme.secondary,
                                                      size: 45,
                                                      disabled:
                                                          state.paymentLoading,
                                                      loading:
                                                          state.discountLoading,
                                                      onPressed: checkoutCubit
                                                          .onDiscountCheckPressed,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20),
                                                Hero(
                                                  tag: 'Btn-1',
                                                  child: U.Button(
                                                    title: 'پرداخت',
                                                    size: U.ButtonSize.lg,
                                                    disabled:
                                                        state.discountLoading,
                                                    loading:
                                                        state.paymentLoading,
                                                    onPressed: checkoutCubit
                                                        .onOrderConfirmed,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
              },
            )),
      ),
    );
  }
}

class _CheckoutItem extends StatelessWidget {
//
  final ShopItem shopItem;

  const _CheckoutItem({
    required this.shopItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          U.Image(
            height: 50,
            width: 50,
            path: shopItem.product.image,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                U.Text(
                  shopItem.product.title,
                  size: U.TextSize.s12,
                  weight: U.TextWeight.medium,
                ),
                Row(
                  children: [
                    U.Text(
                      shopItem.product.price.toString(),
                      size: U.TextSize.s12,
                    ),
                    const SizedBox(width: 8),
                    const U.Text(
                      '*',
                      size: U.TextSize.s12,
                      weight: U.TextWeight.bold,
                      color: U.Theme.primary,
                    ),
                    const SizedBox(width: 8),
                    U.Text(
                      shopItem.count.toString(),
                      size: U.TextSize.s12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          U.Text(
            (shopItem.product.price * shopItem.count).toString(),
            size: U.TextSize.s12,
          ),
        ],
      ),
    );
  }
}
