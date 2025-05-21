import 'package:flutter/material.dart';
import 'package:product_list_demo/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  const ProductItem(
      {super.key,
      required this.product,
      required this.onFavoriteToggle,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.thumbnail ??
            'https://via.placeholder.com/50',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(product.title ?? 'No title'),
      subtitle: Text("\$${product.price}"),
      trailing: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : null,
        ),
        onPressed: onFavoriteToggle,
      ),
    );
  }
}
