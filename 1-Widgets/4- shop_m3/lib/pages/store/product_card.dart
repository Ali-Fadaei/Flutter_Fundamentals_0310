import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';

class ProductCard extends StatelessWidget {
  //
  final Product data;

  const ProductCard({
    super.key,
    required this.data,
  });

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
              Image.asset(data.image),
              // const Size
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    data.title,
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
                    'Rating: ${data.rating}',
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
                    '\$${data.price}',
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
