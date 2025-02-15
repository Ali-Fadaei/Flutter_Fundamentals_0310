import 'package:flutter/material.dart';
import 'package:shop_m3/pages/app_page.dart';
import 'package:shop_m3/pages/category/category_card.dart';

class CategoryPage extends StatelessWidget {
  //
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: categories
              .map(
                (e) => CategoryCard(
                  data: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
