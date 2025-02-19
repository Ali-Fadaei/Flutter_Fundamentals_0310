import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/pages/store/product_card.dart';
import 'package:shop_m3/pages/app_page.dart';

class StorePage extends StatelessWidget {
  //
  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  const StorePage({
    super.key,
    required this.onFavoritesPressed,
    required this.onAddtoCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
              hintText: 'Search Here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Exclusive Offers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 320,
          child: ListView.separated(
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, index) {
              return const SizedBox(
                width: 16,
              );
            },
            itemBuilder: (_, index) {
              return ProductCard(
                data: products[index],
                onAddtoCartPressed: onAddtoCartPressed,
                onFavoritesPressed: onFavoritesPressed,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Exclusive Offers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 320,
          child: ListView.separated(
            itemCount: products.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, index) {
              return const SizedBox(
                width: 16,
              );
            },
            itemBuilder: (_, index) {
              return ProductCard(
                data: products[index],
                onAddtoCartPressed: onAddtoCartPressed,
                onFavoritesPressed: onFavoritesPressed,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //
  //       ],
  //     ),
  //   );
  // }
}
