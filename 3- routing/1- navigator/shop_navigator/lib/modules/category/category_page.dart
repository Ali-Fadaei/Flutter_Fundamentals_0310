import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_navigator/domains/store/models/category.dart';
import 'package:shop_navigator/domains/store/store_repository.dart';
import 'package:shop_navigator/modules/category/cubit/category_cubit.dart';
import 'package:shop_navigator/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_navigator/modules/store/product_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class CategoryPage extends StatelessWidget {
  //
  static const route = '/category';

  final CategoryData category;

  const CategoryPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(
            storeRepo: context.read<StoreRepository>(),
            category: category,
          ),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: context.read<StoreRepository>(),
          ),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return Column(
              children: [
                U.AppBar.secondary(
                  title: 'دسته بندی',
                  onBackPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                U.SearchInput(
                  controller: TextEditingController(),
                  onSearched: () {},
                ),
                Expanded(
                  child: state.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (size.width / 200).floor(),
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 200 / 320,
                          ),
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context, index) {
                            return ProductCard(data: state.products[index]);
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
