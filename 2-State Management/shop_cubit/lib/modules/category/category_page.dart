import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cubit/modules/store/cubit/store_cubit.dart';
import 'category_card.dart';

class CategoryPage extends StatelessWidget {
  //

  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        return GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: (size.width / 200).floor(),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 200 / 320,
          children: state.categories.map((e) => CategoryCard(data: e)).toList(),
        );
      },
    );
  }
}
