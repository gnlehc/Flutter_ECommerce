import 'package:flutter/material.dart';

import '../model.dart';

class ProductCard extends StatelessWidget {
  final Products product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              product.image,
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text('${product.rating}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
