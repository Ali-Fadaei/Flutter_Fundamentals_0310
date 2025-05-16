import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '/modules/shop_cart/shop_cart_card.dart';

class ShopCartPage extends StatelessWidget {
  //
  const ShopCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCartCubit, ShopCartState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.shopItems.length,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemBuilder: (context, index) {
            return ShopCartCard(shopItem: state.shopItems[index]);
          },
        );
      },
    );
  }
}
