import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/category/category_card.dart';
import 'package:shop_cubit/modules/store/cubit/store_cubit.dart';
import '../../domains/store/models/shop_item.dart';
import '../../domains/store/models/product.dart';
import './product_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class StorePage extends StatelessWidget {
  //

  // final List<Product> favorites;

  // final List<ShopItem> shopItems;

  // final void Function(Product data) onFavoritesPressed;

  // final void Function(Product data) onAddtoCartPressed;

  // final void Function(Product data) onRemoveFromCartPressed;

  const StorePage({
    super.key,
    // required this.products,
    // required this.categories,
    // required this.favorites,
    // required this.shopItems,
    // required this.onFavoritesPressed,
    // required this.onAddtoCartPressed,
    // required this.onRemoveFromCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        return ListView(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: U.SearchInput(
                controller: TextEditingController(),
                onSearched: () {
                  print('searching!!!!');
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: U.Image(
                path: U.Images.banner1,
                height: 105,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  U.Text(
                    'فروش ویژه',
                    size: U.TextSize.s20,
                    font: U.TextFont.yekan,
                    weight: U.TextWeight.bold,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 88,
                    child: U.TextButton(
                      title: 'همه',
                      size: U.ButtonSize.sm,
                      color: U.ButtonColor.primary,
                      onPressed: () {
                        print('show All');
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 320,
              child: ListView.separated(
                itemCount: state.products.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (_, index) {
                  // Todo: Migrate this Card to UIKIT
                  return ProductCard(
                    data: state.products[index],
                    // favorites: favorites,
                    // shopItems: shopItems,
                    // onFavoritesPressed: onFavoritesPressed,
                    // onAddtoCartPressed: onAddtoCartPressed,
                    // onRemoveFromCartPressed: onRemoveFromCartPressed,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  U.Text(
                    'دسته بندی',
                    size: U.TextSize.s20,
                    font: U.TextFont.yekan,
                    weight: U.TextWeight.bold,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.separated(
                itemCount: state.categories.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (_, index) {
                  return CategoryCard(data: state.categories[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  U.Text(
                    'پرفروش‌ها',
                    size: U.TextSize.s20,
                    font: U.TextFont.yekan,
                    weight: U.TextWeight.bold,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 88,
                    child: U.TextButton(
                      title: 'همه',
                      size: U.ButtonSize.sm,
                      color: U.ButtonColor.primary,
                      onPressed: () {
                        print('show All');
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 320,
              child: ListView.separated(
                itemCount: state.products.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) {
                  return const SizedBox(width: 16);
                },
                itemBuilder: (_, index) {
                  // Todo: Migrate this Card to UIKIT
                  return ProductCard(
                    data: state.products[index],
                    // favorites: favorites,
                    // shopItems: shopItems,
                    // onFavoritesPressed: onFavoritesPressed,
                    // onAddtoCartPressed: onAddtoCartPressed,
                    // onRemoveFromCartPressed: onRemoveFromCartPressed,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
