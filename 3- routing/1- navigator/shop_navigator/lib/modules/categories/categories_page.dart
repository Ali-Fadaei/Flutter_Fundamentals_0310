import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/domains/store/store_repository.dart';
import 'cubit/categories_cubit.dart';
import 'category_card.dart';

class CategoriesPage extends StatelessWidget {
  //

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CategoriesCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return state.loading
              ? Center(
                  child: SizedBox.square(
                    dimension: 30,
                    child: CircularProgressIndicator(),
                  ),
                )
              : GridView.count(
                  padding: const EdgeInsets.all(16),
                  crossAxisCount: (size.width / 200).floor(),
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 200 / 320,
                  children: state.categories
                      .map((e) => CategoryCard(data: e))
                      .toList(),
                );
        },
      ),
    );
  }
}
