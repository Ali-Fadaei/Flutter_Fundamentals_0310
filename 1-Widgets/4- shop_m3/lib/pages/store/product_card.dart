import 'package:flutter/material.dart';
import 'package:shop_m3/models/product.dart';
import 'package:shop_m3/pages/store/product_btms.dart';

class ProductCard extends StatelessWidget {
  //
  final Product data;

  final void Function(Product data) onFavoritesPressed;

  final void Function(Product data) onAddtoCartPressed;

  const ProductCard({
    super.key,
    required this.data,
    required this.onFavoritesPressed,
    required this.onAddtoCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          // isDismissible: false,
          isScrollControlled: true,
          // backgroundColor: Colors.cyan,
          // barrierColor: Colors.blueGrey.withValues(alpha: 0.50),
          constraints: BoxConstraints(
            maxWidth: 600,
            maxHeight: MediaQuery.of(context).size.height * 0.75,
          ),
          builder: (context) {
            return ProductBottomSheet();
          },
        );
      },
      child: SizedBox(
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
                    Expanded(
                      child: Text(
                        data.title,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                      onPressed: () => onAddtoCartPressed(data),
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
      ),
    );
  }
}
