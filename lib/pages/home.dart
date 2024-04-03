import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/bloc/products/product_bloc.dart';
import 'package:trainingassignment/bloc/products/product_event.dart'; // Add this import
import 'package:trainingassignment/bloc/products/product_state.dart'; // Add this import
import 'package:trainingassignment/home_page/product_cart.dart';
import 'package:trainingassignment/service/product_service.dart';
import '../bloc/account/login_event.dart';
import '../footer.dart';
import '../navbar.dart';

class Home extends StatelessWidget {
  late String? username;

  Home({Key? key, this.username = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? ScreenArguments(username: username!)
        : ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    if (args.username.isNotEmpty) username = args.username;

    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(productService: ProductService())
        ..add(
            const FetchListProductData()), // Initialize and fetch product data
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitialState) {
            return const LoadingIndicator();
          } else if (state is ProductSuccessState) {
            final listProd = state.data; // Use the product data from the state
            return Material(
              child: Scaffold(
                backgroundColor: const Color(0xf1f1f1f1),
                appBar: PreferredSize(
                  preferredSize: const Size(100, 50),
                  child: Navbar(
                    username: username!,
                  ),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 40),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4)),
                                color: Colors.green),
                            alignment: Alignment.topCenter,
                            child: const Text(
                              "30% OFF - Ramadhan Sale",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(4),
                                    bottomRight: Radius.circular(4)),
                                color: Colors.green),
                            alignment: Alignment.topCenter,
                            child: const Text(
                              "*Promotion is valid for regular-priced items, except for special collections.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            height: 80,
                            padding: const EdgeInsets.only(bottom: 20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                              color: Colors.green,
                            ),
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/category');
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 40, right: 40),
                                child: Text(
                                  "BUY NOW",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "All Products",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              childAspectRatio: 1,
                            ),
                            itemCount: listProd.length,
                            itemBuilder: (context, index) {
                              if (index < listProd.length) {
                                final product = listProd[index];
                                return ProductCard(
                                  product: product,
                                );
                              } else {
                                return Container(); // Add a placeholder for debugging
                              }
                              // final product = listProd[index];
                              // return ProductCard(
                              //   product: product,
                              // );
                            },
                          ),
                          Footer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (state is ProductErrorState) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const LoadingIndicator();
          }
        },
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
