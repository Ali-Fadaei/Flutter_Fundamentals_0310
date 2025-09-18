import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/modules/category/category_page.dart';
import '/modules/home/cubit/home_cubit.dart';
import '/modules/search/search_page.dart';
import '/modules/store/product_btms.dart';
import '/domains/store/store_repository.dart';
import '../categories/category_card.dart';
import '/modules/shop_cart/cubit/shop_cart_cubit.dart';
import '/modules/store/cubit/store_cubit.dart';
import './product_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class StorePage extends StatelessWidget {
  //
  static const route = '/store';

  final int? initialProductId;

  const StorePage({
    super.key,
    this.initialProductId,
  });

  @override
  Widget build(BuildContext context) {
    print('initialProductId');
    print(initialProductId);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreCubit(
            initialProductId: initialProductId,
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ShopCartCubit, ShopCartState>(
            listenWhen: (previous, current) =>
                previous.shopItems.length != current.shopItems.length,
            listener: (context, state) {
              context
                  .read<HomeCubit>()
                  .onShopItemsCountChanged(state.shopItems.length);
            },
          ),
          BlocListener<HomeCubit, HomeState>(
            listenWhen: (previous, current) =>
                previous.selectedIndex != current.selectedIndex,
            listener: (context, state) {
              context.read<ShopCartCubit>().onRefresh();
            },
          ),
          BlocListener<StoreCubit, StoreState>(
            listenWhen: (previous, current) =>
                previous.initialProduct != current.initialProduct &&
                current.initialProduct != null,
            listener: (context, state) {
              ProductBottomSheet.show(
                context,
                product: state.initialProduct!,
              );
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
              child: BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  final storeCubit = context.read<StoreCubit>();
                  return ListView(
                    padding: const EdgeInsets.only(bottom: 85),
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: U.SearchInput(
                          controller: storeCubit.searchCtrl,
                          onSearched: () {
                            GoRouter.of(context).goNamed(
                              SearchPage.route,
                              pathParameters: {
                                'title': storeCubit.searchCtrl.text,
                              },
                            );
                            storeCubit.searchCtrl.clear();
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      U.Banner(
                        banners: [
                          U.BannerItem(
                            img: U.Images.banner1,
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                CategoryPage.route,
                                pathParameters: {
                                  'id': '0',
                                },
                              );
                            },
                          ),
                          U.BannerItem(
                            img: U.Images.banner2,
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                CategoryPage.route,
                                pathParameters: {
                                  'id': '1',
                                },
                              );
                            },
                          ),
                          U.BannerItem(
                            img: U.Images.banner3,
                            onTap: () {
                              print('3');
                            },
                          ),
                          U.BannerItem(
                            img: U.Images.banner4,
                            onTap: () {
                              print('4');
                            },
                          ),
                          U.BannerItem(
                            img: U.Images.banner5,
                            onTap: () {
                              print('5');
                            },
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: U.Image(
                      //     path: U.Images.banner1,
                      //     height: 105,
                      //     fit: BoxFi  t.cover,
                      //   ),
                      // ),
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
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 320,
                        child: state.loading
                            ? Center(
                                child: SizedBox.square(
                                  dimension: 30,
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : ListView.separated(
                                itemCount: state.products.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (_, index) {
                                  return const SizedBox(width: 16);
                                },
                                itemBuilder: (_, index) {
                                  return ProductCard(
                                      data: state.products[index]);
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
                        child: state.loading
                            ? Center(
                                child: SizedBox.square(
                                  dimension: 30,
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : ListView.separated(
                                itemCount: state.categories.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (_, index) {
                                  return const SizedBox(width: 16);
                                },
                                itemBuilder: (_, index) {
                                  return CategoryCard(
                                    useGo: false,
                                    data: state.categories[index],
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
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 320,
                        child: state.loading
                            ? Center(
                                child: SizedBox.square(
                                  dimension: 30,
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : ListView.separated(
                                itemCount: state.products.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (_, index) {
                                  return const SizedBox(width: 16);
                                },
                                itemBuilder: (_, index) {
                                  return ProductCard(
                                      data: state.products[index]);
                                },
                              ),
                      ),
                      const SizedBox(height: 20),
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
