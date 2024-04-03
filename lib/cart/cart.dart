import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/bloc/cart_bloc.dart';
import 'package:trainingassignment/navbar.dart';

import '../bloc/account/login_event.dart';
import '../model/cart_model.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class Cart extends StatelessWidget {
  late double price = 0.0;
  late String username = "";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? ScreenArguments(username: username)
        : ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    if (args.username.isNotEmpty) username = args.username;

    return BlocProvider(
      create: (context) => CartBloc(),
      child: BlocBuilder<CartBloc, List<CartProductModel>>(
        builder: (context, state) {
          if (state.isEmpty) {
            BlocProvider.of<CartBloc>(context).add(1);
            return LoadingIndicator();
          } else {
            // Calculate total price
            final totalPrice = state.fold(
                0,
                (previousValue, element) =>
                    previousValue + (element.price * element.quantity).toInt());

            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size(100, 50),
                child: Navbar(username: username),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          color: Color(0xFF2F6799),
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final e = state[index];
                        return Padding(
                          padding: EdgeInsets.all(40),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 100),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFF2F6799)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    e.image,
                                    width: 200,
                                    height: 160,
                                  ),
                                ),
                              ),
                              Container(
                                width: 170,
                                child: Text(
                                  e.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: Text(
                                  "${e.quantity} (pcs)",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: Text(
                                  "\$${e.price}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: Text(
                                  "\$${e.quantity * e.price}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    color: Color(0xFF2f6799),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 20),
                      child: Text(
                        "Grand Total: \$${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
