import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  //
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 320,
      width: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image.asset('assets/imgs/products/asus_rt.png'),
              // const Size
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    'Product Title',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  Text(
                    'Rating: 4.5',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                  const Spacer(),
                  Text(
                    '\$230',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
