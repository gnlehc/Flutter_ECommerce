import 'package:flutter/material.dart';
import 'package:trainingassignment/home_page/detail_product.dart';
import '../fetch/model.dart';

class ProductCard extends StatelessWidget {
  late Products product;
  late String username = '';
  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? ScreenArguments()
        : ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    if (args.username.isNotEmpty) username = args.username;
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduct(
                        detail: product,
                      ),
                  settings: RouteSettings(
                      name: '/Products',
                      arguments: ScreenArguments(username: username))));
          // Navigator.pushNamed(context, '/Product');
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GestureDetector(onTap: ,)
              Center(
                child: Image.network(
                  product.image,
                  width: 100,
                  height: 170,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
            ],
          ),
        ));
  }
}
