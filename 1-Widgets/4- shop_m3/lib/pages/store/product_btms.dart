import 'package:flutter/material.dart';

class ProductBottomSheet extends StatelessWidget {
  //
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 8,
                width: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.outline,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: [
                SizedBox.square(
                  dimension: 350,
                  child: Image.asset(
                    'assets/imgs/products/s23_ultra.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'category',
                          style: TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline,
                        // Icons.favorite,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Rating: ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '4.4',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 20,
                      child: VerticalDivider(
                        width: 12,
                        thickness: 1.5,
                      ),
                    ),
                    Text(
                      'Price: ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text('\$${18000}'),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Product Detail',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'lkfjskdjfskdjf',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
