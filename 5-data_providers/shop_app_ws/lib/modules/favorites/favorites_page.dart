import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/modules/home/cubit/home_cubit.dart';
import '/domains/store/store_repository.dart';
import '/modules/favorites/cubit/favorites_cubit.dart';
import 'favorites_card.dart';
import '/ui_kit/ui_kit.dart' as U;

class FavoritesPage extends StatelessWidget {
  //
  static const route = '/favorites';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeCubit, HomeState>(
            listenWhen: (previous, current) =>
                previous.selectedIndex != current.selectedIndex,
            listener: (context, state) {
              if (state.selectedIndex == 3) {
                final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
                favoritesCubit.onRefresh();
              }
            },
          ),
          BlocListener<FavoritesCubit, FavoritesState>(
            listenWhen: (previous, current) =>
                previous.favorites.length != current.favorites.length,
            listener: (context, state) {
              final homeCubit = context.read<HomeCubit>();
              homeCubit.onFavsCountChanged(state.favorites.length);
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
              child: BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
                  final favCubit = context.read<FavoritesCubit>();
                  return state.loading
                      ? ListView.separated(
                          itemCount: 20,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          itemBuilder: (context, index) {
                            return U.Shimmer.contain(
                              enable: true,
                              containHeight: 140,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 16);
                          },
                        )
                      : switch (state.contentStatus) {
                          FavoriteContentStatus.empty => Column(
                              children: [
                                const Spacer(),
                                U.Image(
                                  height: 360,
                                  width: 360,
                                  path: U.Images.emptyFav,
                                ),
                                const Spacer(),
                              ],
                            ),
                          FavoriteContentStatus.error => Column(
                              children: [
                                const Spacer(),
                                U.Image(
                                  height: 360,
                                  width: 360,
                                  path: U.Images.emptyFav,
                                ),
                                U.Text(
                                  'خطایی در بارگیری اطلاعات رخ داده.',
                                  size: U.TextSize.s16,
                                  weight: U.TextWeight.medium,
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 140,
                                  child: U.Button(
                                    title: 'تلاش مجدد',
                                    onPressed: () {
                                      favCubit.onRetry();
                                    },
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          FavoriteContentStatus.filled => U.RefreshIndicator(
                              onRefresh: favCubit.onRefresh,
                              child: ListView.separated(
                                itemCount: state.favorites.length,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 16,
                                ),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 16);
                                },
                                itemBuilder: (context, index) {
                                  final data = state.favorites[index];
                                  return Column(
                                    children: [
                                      FavoritesCard(product: data),
                                    ],
                                  );
                                },
                              ),
                            ),
                        };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
