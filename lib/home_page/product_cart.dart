import 'package:flutter/material.dart';
import '../bloc/account/login_event.dart';
import '../model/login_model.dart';
import '../model/product_model.dart';
import '../routes/router.dart';

class ProductCard extends StatelessWidget {
  final MsProduct product;
  late String username = '';
  ProductCard({Key? key, required this.product}) : super(key: key) {
    print('ProductCard Created: ${product.title}');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? ScreenArguments(username: username)
        : ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    if (args.username.isNotEmpty) username = args.username;
    return GestureDetector(
        onTap: () {
          Application.router.navigateTo(context, '/products/${product.id}',
              routeSettings: RouteSettings(
                  arguments: ScreenArguments(username: username)));
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
