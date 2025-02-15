import 'package:flutter/material.dart';
import 'package:shop_m3/pages/store/product_card.dart';

class StorePage extends StatelessWidget {
  //
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          //TODO:
          const SizedBox(
            height: 320,
            child: Center(
              child: ProductCard(),
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
          //TODO:
          const SizedBox(
            height: 320,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
