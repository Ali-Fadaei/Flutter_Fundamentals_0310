import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/modules/checkout/checkout_page.dart';
import '/modules/home/cubit/home_cubit.dart';
import '/domains/store/store_repository.dart';
import '/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '/modules/shop_cart/shop_cart_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class ShopCartPage extends StatelessWidget {
  //
  static const route = '/shopcart';
  const ShopCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCartCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeCubit, HomeState>(
            listenWhen: (previous, current) =>
                previous.selectedIndex != current.selectedIndex,
            listener: (context, state) {
              if (state.selectedIndex == 1) {
                final shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
                shopCartCubit.onRefresh();
              }
            },
          ),
          BlocListener<ShopCartCubit, ShopCartState>(
            listenWhen: (previous, current) =>
                previous.shopItems.length != current.shopItems.length,
            listener: (context, state) {
              final homeCubit = context.read<HomeCubit>();
              homeCubit.onShopItemsCountChanged(state.shopItems.length);
            },
          ),
        ],
        child: Column(
          children: [
            U.AppBar.primary(
              onMenuPressed: () {},
              onNotifPressed: () {},
            ),
            Expanded(
              child: BlocBuilder<ShopCartCubit, ShopCartState>(
                builder: (context, state) {
                  return state.loading && state.shopItems.isEmpty
                      ? Center(
                          child: SizedBox.square(
                            dimension: 30,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : state.shopItems.isEmpty
                          ? Center(child: U.Text('لیست علاقه‌مندی خالیه!!!'))
                          : Stack(
                              children: [
                                ListView.separated(
                                  itemCount: state.shopItems.length,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 16,
                                  ),
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 16);
                                  },
                                  itemBuilder: (context, index) {
                                    final data = state.shopItems[index];
                                    return Column(
                                      children: [
                                        ShopCartCard(shopItem: data),
                                        if (state.loading &&
                                            data == state.shopItems.last) ...[
                                          SizedBox(height: 20),
                                          Center(
                                            child: SizedBox.square(
                                              dimension: 30,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ],
                                      ],
                                    );
                                  },
                                ),
                                Positioned(
                                  bottom: 85,
                                  left: 16,
                                  right: 16,
                                  child: Hero(
                                    tag: 'Btn-1',
                                    child: U.Button(
                                      title: 'تکمیل خرید',
                                      trailingText:
                                          '${state.totalAmount} تومان',
                                      size: U.ButtonSize.lg,
                                      onPressed: () {
                                        GoRouter.of(context).goNamed(
                                          CheckoutPage.route,
                                          extra: state.shopItems,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
