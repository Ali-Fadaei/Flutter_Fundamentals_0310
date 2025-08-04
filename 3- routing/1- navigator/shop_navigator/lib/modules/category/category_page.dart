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
  static const String path = '/CategoryPage';
  final CategoryData category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryCubit(
                id: category.id,
                repo: RepositoryProvider.of<StoreRepository>(context)),
          ),
          BlocProvider(
            create: (context) => ShopCartCubit(
                storeRepo: RepositoryProvider.of<StoreRepository>(context)),
          )
        ],
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return Scaffold(
              // appBar:AppBar(a) U.AppBar.secondary(
              //     title: state.category.title,
              //     onBackPressed: () {
              //       Navigator.pop(context);
              //     }),
              body: Column(
                children: [
                  U.AppBar.secondary(
                      title: state.category?.title ?? 'category ',
                      onBackPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 11,
                  ),
                  Expanded(
                    child: state.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            color: state.category?.color ?? Colors.white,
                            child: GridView.builder(
                                itemCount: state.products.length,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        crossAxisSpacing: 11,
                                        childAspectRatio: 200 / 320,
                                        maxCrossAxisExtent: 300,
                                        mainAxisSpacing: 11),
                                padding: EdgeInsets.all(11),
                                itemBuilder: (context, index) {
                                  final temp = state.products;
                                  return ProductCard(data: temp[index]);
                                }),
                          ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
