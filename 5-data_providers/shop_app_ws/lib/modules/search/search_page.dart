import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/domains/store/store_repository.dart';
import '/modules/search/cubit/search_cubit.dart';
import '/modules/search/search_filter_btms.dart';
import '/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '/modules/store/product_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class SearchPage extends StatelessWidget {
//
  static const route = '/search/:title';

  final String searchTitle;

  const SearchPage({
    super.key,
    required this.searchTitle,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            searchTitle: searchTitle,
            storeRepo: context.read<StoreRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: context.read<StoreRepository>(),
          ),
        ),
      ],
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final searchCubit = context.read<SearchCubit>();
          return Scaffold(
            backgroundColor: U.Theme.background,
            body: SizedBox.expand(
              child: Column(
                children: [
                  U.AppBar.secondary(
                    title: 'جستجوی محصولات',
                    onBackPressed: () => GoRouter.of(context).pop(),
                    action: U.IconButton(
                      icon: U.Image.icon(path: U.Icons.filter),
                      onPressed: () => SearchFilterBottomSheet.show(
                        context,
                        searchCubit: searchCubit,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: U.SearchInput(
                      controller: searchCubit.searchCtrl,
                      isSearched: state.isSearched,
                      onSearched: searchCubit.onSearched,
                    ),
                  ),
                  Expanded(
                    child: state.loading
                        ? Center(child: const CircularProgressIndicator())
                        : GridView.builder(
                            itemCount: state.products.length,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (MediaQuery.of(context).size.width / 190)
                                      .floor(),
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 2 / 3.5,
                            ),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                data: state.products[index],
                              );
                            },
                          ),
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
