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
  static const route = "/category";

  final int categoryId;

  const CategoryPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(
              storeRepo: context.read<StoreRepository>(), id: categoryId),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: context.read<StoreRepository>(),
          ),
        ),
      ],
      child:  BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: U.Theme.background,
            body: AnimatedContainer(
              duration:const Duration(milliseconds: 500) ,
              color: state.category?.color.withValues(alpha: 0.5) ?? U.Theme.background,
              child: Column(
                  children: [
                    U.AppBar.secondary(title:state.category?.title ?? "دسته بندی", onBackPressed: () {
                      Navigator.of(context).pop();
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    U.SearchInput(
                        controller: TextEditingController(), onSearched: () {}),
                    Expanded(
                      child: state.loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: state.Products.length,
                              
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: (Size.width / 200).floor(),
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 200/320,
                                      ),
                              itemBuilder: (context, index) {
                                return ProductCard(data: state.Products[index]);
                              }),
                    ),
                  ],
                ),
            ),
            );
          },
        ),
      
    );
  }
}
