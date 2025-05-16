import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/favorites/cubit/favorites_cubit.dart';
import 'favorites_card.dart';

class FavoritesPage extends StatelessWidget {
  //
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.favorites.length,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemBuilder: (context, index) {
            final data = state.favorites[index];
            return FavoritesCard(product: data);
          },
        );
      },
    );
  }
}
